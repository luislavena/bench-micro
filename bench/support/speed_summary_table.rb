require_relative 'table_helpers'

class SpeedSummaryTable
  include TableHelpers
  attr_accessor :content # content: output from wrk, stripped a bit

  def initialize(content)
    @content = content
  end

  def summary_table
    summary = []
    summary << table_row("Framework", "Requests/sec", '% from best')
    summary << table_separator
    summary << table
  end

  def render
    summary_table.join("\n")
  end

  def lines
    content.split("\n")
  end

  def results
    lines.each_slice(2).map do |pair|
      name   = pair[0].gsub("*", '').strip.downcase
      number = pair[1].match(/(\d|\.)+/)[0]
      [name, number]
    end
  end

  def sorted_results
    @sorted_results ||= results.sort_by{|x| - x[1].to_i}
  end

  def max_rps
    sorted_results.first[1].to_f
  end

  def table
    sorted_results.map do |pair|
      name  = pair[0]
      rps   = pair[1]
      num   = (pair[1].to_f/max_rps)
      round = ((num * 10000).round*1.0 ) / 100
      table_row(name, rps, round.to_s + "%")
    end.join("\n")
  end
end
