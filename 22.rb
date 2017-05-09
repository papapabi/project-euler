require 'benchmark'

time = Benchmark.measure do
  sum = 0
  names = []

  File.foreach("string_22.dat", ",") do |name|
    name = name.delete('"').delete(",")
    names.push(name)
  end

  names.sort! # Ruby implements the #sort method with quicksort, so we should be fine even if the file was a lot bigger.

  names.each_with_index do |name, index|
    # Leverage the fact that ASCII values are +64 of what the letter's place was in the alphabet.
    # For instance, A = 65 (1), B = 66 (2), and so on.
    sum +=  name.chars.map { |char| char = char.ord - 64 }.reduce(:+) * (index + 1) # The rule was to multiply the position of the name in the sorted list with the 'sum' of its letters.
  end

  puts "The total of all name scores in string_22.dat is #{sum}"
end

puts "Time elapsed (in seconds): #{time}"