require 'benchmark'

time = Benchmark.measure do
  puts "The sum of the digits of 100! is " +
  (1..100).inject(:*).to_s.chars.map(&:to_i).reduce(:+).to_s
end

puts "Time elapsed (in seconds): #{time}"
