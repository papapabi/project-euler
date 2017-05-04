require 'benchmark'

time = Benchmark.measure do
  puts "The sum of the digits of the number 2^1000 is #{(2**1000).to_s.chars.map(&:to_i).reduce(:+)}"
end

puts "Time elapsed (in seconds): #{time}"