require "benchmark"

time = Benchmark.measure do
  num = 20 # start with +1 of max divisor
  while ( num % 2 != 0 || num % 3 != 0 || num % 4 != 0 || num % 5 != 0 || num % 6 != 0 || num % 7 != 0 || num % 8 != 0 || num % 9 != 0 || num % 10 != 0 || num % 11 != 0 || num % 12 != 0 || num % 13 != 0 || num % 14 != 0 || num % 15 != 0 || num % 16 != 0 ||num % 17 != 0 || num % 18 != 0 || num % 19 != 0 || num % 20 != 0) do
    num += 20
  end
  puts "The smallest positive number that is evenly divisible by ints in the range [1, 20] is #{num}"
end

puts "Time elapsed (in seconds): #{time}"

