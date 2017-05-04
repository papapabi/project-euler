require 'benchmark'


# This solution employs iterative dynamic programming, a bottom-up approach.
#
# More specifically, this solution iterates from the bottom row upwards; reducing the triangle's
# dimensionality until we're (effectively) left with an array with size = 1.
#
# Given this example:
#      1
#    2   3
# 21   2    1
# We can see that the naive, top-down greedy search for the largest sum gives us the answer 6.
# Starting from the top, [1 => 3 > 1 so let's go there (3+1) => 4 => 2 > 1 so let's go there (4+2) => 6!]
# But we can easily see that the correct maximal sum for the triangle is 24 (1+2+21), taking the leftmost path.
#
# This is why dynamic programming was my chosen solution.

time = Benchmark.measure do
  temp_int_ar = Array.new # The array we use for 'memoization.'
  cur_int_ar = Array.new # The current array we're iterating in.

  File.readlines("string_18.dat").reverse_each.with_index do |line, index| # Start at the last line.
    if index == 0 # When at the last line only
      temp_int_ar = line.chomp.split.map(&:to_i)
      next
    else
      cur_int_ar = line.chomp.split.map(&:to_i)
      cur_int_ar.each_with_index do |val, index|
        # Check which adjacent number in the memoized array gives the larger sum when added to the current iterated element in the current iterated line.
        temp_int_ar[index] > temp_int_ar[index + 1] ? temp_int_ar[index] = cur_int_ar[index] + temp_int_ar[index] : temp_int_ar[index] = cur_int_ar[index] + temp_int_ar[index + 1]
      end
    end
  end
  puts "The largest sum in the routes of the triangle given by string_18.dat is #{temp_int_ar.first}"
end

puts "Time elapsed (in seconds): #{time}"