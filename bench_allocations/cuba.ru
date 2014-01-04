require File.expand_path('../../apps/cuba', __FILE__)
require 'rack/mock'
require 'allocation_stats'

app = HelloWorld
request = Rack::MockRequest.env_for('/')

stats = AllocationStats.new(burn: 1).trace do
  app.call(request)
end

puts "total allocations: #{stats.allocations.all.size}"

puts 'allocations by source file and class:'
puts stats.allocations(alias_paths: true).
          group_by(:sourcefile, :class_plus).
          sort_by_count.
          to_text