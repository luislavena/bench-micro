require 'bundler'
Bundler.setup
# dummy run method
def run(*args); ; end

require 'rack/mock'
require 'allocation_stats'

class AllocationsBenchmarker
  attr_accessor :config

  def initialize(config)
    @config = config

    load_script
  end

  def load_script
    Object.send(:remove_const, :APP) if Object.constants.include?(:APP)
    Object.send(:remove_const, :HelloWorld) if Object.constants.include?(:HelloWorld)
    Object.send(:remove_const, :HelloController) if Object.constants.include?(:HelloController)

    load "./#{config}"
  end

  def human_output
    puts frameworkname
    puts "total allocations: #{total_allocations}"
    puts "total memsize: #{total_memsize}"
    detailed_allocations
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
    @stats ||= AllocationStats.new(burn: 5).trace do
      APP.call(request)
    end
  end
end
