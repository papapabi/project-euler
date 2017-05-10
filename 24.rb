require 'benchmark'

time = Benchmark.measure do
  # I kind of hate (not) it when a language solves something natively.
  # The cool thing about this is Ruby's built-in permutation function spits out permutations lexicographically.
  puts "The millionth lexicographic permutation of the digits in the range [0, 9]
  is #{(0..9).to_a.permutation.to_a[(1000000) - 1].join}"
end

puts "Time elapsed (in seconds): #{time}"