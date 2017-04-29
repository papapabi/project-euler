require "benchmark"

time = Benchmark.measure do
  sum_of_squares = (1..100).map { |i| i ** 2 }.inject(:+)
  square_of_sum = (1..100).inject(:+) ** 2
  puts "Sum of squares: " + sum_of_squares.inspect
  puts "Square of sum: " + square_of_sum.inspect
  puts "Difference: " + (square_of_sum - sum_of_squares).inspect
end

puts "Time elapsed (in seconds): #{time}"
