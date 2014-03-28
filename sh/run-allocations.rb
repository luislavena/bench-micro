#!/usr/bin/env ruby
require 'bundler'
Bundler.setup
# dummy run method
def run(*args); ; end

require 'rack/mock'
require 'allocation_stats'

class AllocationsTracker
  attr_accessor :config
  def initialize(config)
    @config = config
    load "./#{config}"
  end

  def human_output
    puts frameworkname
    puts "total allocations: #{total_allocations}"
    puts "total memsize: #{total_memsize}"
    puts
  end

  def total_allocations
    stats.allocations.all.size
  end

  def total_memsize
    stats.allocations.bytes.to_a.inject(&:+)
  end

  def machine_result
    {
      :frameworkname     => frameworkname,
      :total_allocations => total_allocations,
      :total_memsize     => total_memsize
    }
  end


  def detailed_allocations
    puts 'allocations by source file and class:'
    puts stats.allocations(alias_paths: true).
          group_by(:sourcefile, :class_plus).
          sort_by_count.
          to_text
  end

  def request
    Rack::MockRequest.env_for('/')
  end

  def frameworkname
    File.basename(config).gsub(".ru", '').upcase
  end

  def stats
    @stats ||= AllocationStats.new(burn: 1).trace do
      app.call(request)
    end
  end

  def app
    APP
  end
end

results = Dir['apps/*.ru'].map do |file|
  tracker = AllocationsTracker.new(file)
  tracker.human_output
  Object.send(:remove_const, :APP)
  Object.send(:remove_const, :HelloWorld) if Object.constants.include?(:HelloWorld)
  Object.send(:remove_const, :HelloController) if Object.constants.include?(:HelloController)
  tracker.machine_result
end



def table_header(a,b,c)
  "#{a.ljust(20)} #{b.to_s.ljust(10)} #{c.to_s.ljust(10)}"
end

def table_row(a,b,c)
  "#{a.ljust(20)} #{b.to_s.rjust(10)} #{c.to_s.rjust(10)}"
end

sorted = results.sort_by{|x| x[:total_allocations]}
table = sorted.map do |res|
  name        = res[:frameworkname].downcase
  allocations = res[:total_allocations]
  memory      = res[:total_memsize]
  table_row(name, allocations, memory)
  #"#{name.ljust(20)} #{allocations.to_s.ljust(10)} #{memory.to_s.ljust(10)}"
end.join("\n")

puts "*"*80
puts "SUMMARY:"
puts table_row("Framework", "Tot. alloc.", 'Tot. mem.')
puts table

