#!/usr/bin/env ruby
class SummaryTable
  def generate
    lines = File.read('summary.txt').split("\n")
    results = lines.each_slice(2).map do |pair|
      name   = pair[0].gsub("*", '').strip.downcase
      number = pair[1].match(/(\d|\.)+/)[0]
      [name, number]
    end
    sorted = results.sort_by {|x| - x[1].to_i}
    max    = sorted.first[1].to_f
    table = sorted.map do |pair|
      num   = (pair[1].to_f/max)
      round = ((num * 100).round*1.0 )/ 100
      "#{(pair[0] + ":").ljust(17)} #{pair[1]} req/sec (#{round.to_s.ljust(4, '0')}x)"
    end.join("\n")
    table
  end
end

puts SummaryTable.new.generate
