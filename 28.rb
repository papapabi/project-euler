require 'benchmark'

time = Benchmark.measure do
  sum = 1

  3.step(1001, 2)  { |i|
    sum += (main_diag = i**2) # The elements of the diagonal that goes up-right (/).
    3.times { sum += (main_diag -= (i-1)) } # Extrapolate other 3 corners of the grid from the "main diagonal".
  }

  puts "The sum of the numbers on the diagonals in a 1001 by 1001 spiral is #{sum}"
end

puts "Time elapsed (in seconds): #{time}"