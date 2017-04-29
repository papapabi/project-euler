require "benchmark"
time = Benchmark.measure do
  puts "The sum of all multiples of 3 or 5 below 1000 is #{1.upto(999).inject(0) { |result, i| (i % 3 == 0 or i % 5 == 0) ? result + i : result}}"
end

puts "Time elapsed (in seconds): #{time}"
