#!/usr/bin/env ruby

def validate *input
  false if input.nil?
  input = input[0] if input.length == 1
  input
end

def insertion_sort *input
  input = validate *input
  output = [input[0]]
  1.upto(input.length - 1) do |from|
    to = 0
    loop do
      break unless input[from] > output[to]
      to += 1
      break if to >= output.length
    end
    output.insert(to, input[from])
  end
  output
end

def bubble_sort *input
  if input[0].class == Hash and not input[0][:digits].nil?
    digits = input[0][:digits] if input[0][:digits].class == Fixnum
    input.shift
  end
  list = validate *input
  begin
    n = 0
    (list.length - 1).times do |a|
      b = a + 1
      unless digits.nil?
       #range = list.max.to_s.length - 1 - digits .. list.max.to_s.length - 1
        pos = list.max.to_s.length - 1
        next unless list[a].to_s[pos].to_i > list[b].to_s[pos].to_i
      else
        next unless list[a] > list[b]
      end
      next unless list[a] > list[b]
      list[a], list[b] = list[b], list[a]
      n += 1
    end
  end while n > 0
  list
end

def radix_sort *input
  list = validate *input
  1.upto(input.max.to_s.length) do |digits|
    list = bubble_sort({digits: digits}, list)
  end
  list
end

def radix_string_sort *input
  input = validate *input
  output = []
  (input.max.to_s.length - 1).downto(0) do |pos|
    digits = []
    input.each do |int|
      digits << int.to_s[pos].to_i
    end
    sorted = bubble_sort digits
    sorted.length.times do |n|
      if output[n].nil?
        output[n] = sorted[n].to_s
      else
        output[n] = sorted[n].to_s + output[n]
      end
    end
  end
  output.length.times do |i|
    output[i] = output[i].to_i
  end
  output
end

def quick_sort *input
  input = validate *input
end

#input = []
#(rand(5) + 5).times { input.push rand(99) }
#p input
#print "insertion_sort: "
#p insertion_sort input
#print "   bubble_sort: "
#p bubble_sort input
#print "    radix_sort: "
#p radix_sort input

