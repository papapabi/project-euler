require 'benchmark'

time = Benchmark.measure do
puts "The last 10 digits of sum(i**i) where i goes from 1 -> 1000 is "\
     "#{(1..1000).to_a.map { |i| i**i }.inject(:+).to_s.chars.last(10).join}"
end
puts "Time elapsed (in seconds): #{time}"
