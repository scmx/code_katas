#!/usr/bin/env ruby

require "benchmark"

require "../sort_of.rb"

iterations = 100
values = rand(50) + 50
maximum = 9999

lists = []
iterations.times do |n|
  input = []
  values.times { input.push rand(maximum) }
  lists << input
end

puts "Test:"
print "unsorted:  "; p lists[0]
print "insertion: "; p insertion_sort lists[0]
print "bubble:    "; p    bubble_sort lists[0]
print "radix:     "; p     radix_sort lists[0]
puts

puts "Benchmark: Running #{iterations} iterations for each sorter."
puts "Sorting arrays with #{values} items and values 0..#{maximum}."
Benchmark.bm (6) do |x|
  x.report ("insert:") {iterations.times {|n| insertion_sort lists[n]}}
  x.report ("bubble:") {iterations.times {|n| bubble_sort lists[n]}}
  x.report ("radix:" ) {iterations.times {|n| radix_sort lists[n]}}
end
