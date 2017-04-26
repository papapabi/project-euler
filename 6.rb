sum_of_squares = (1..100).map { |i| i ** 2 }
sum_of_squares = sum_of_squares.inject(:+)
square_of_sum = 0
(1..100).each do |i|
  square_of_sum += i
end
square_of_sum = square_of_sum ** 2

puts "Sum of squares: " + sum_of_squares.inspect
puts "Square of sum: " + square_of_sum.inspect
puts "Difference: " + (square_of_sum - sum_of_squares).inspect
