require_relative 'table_helpers'
class AllocationSummaryTable
  include TableHelpers
  attr_accessor :results

  def initialize(results)
    @results = results
  end

  def tab_props
    [15,10,11]
  end

  def summary_table
    summary = []
    summary << table_row("Framework", "Allocs/Req", 'Memsize/Req')
    summary << table_separator
    summary << table
  end

  def render
    summary_table.join("\n")
  end

  def sorted_results
    results.sort_by{|x| x[:total_allocations]}
  end

  def table
    sorted_results.map do |res|
      name        = res[:frameworkname].downcase
      allocations = res[:total_allocations]
      memory      = res[:total_memsize]
      table_row(name, allocations, memory)
    end.join("\n")
  end
end
