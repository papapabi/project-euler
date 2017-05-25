require 'benchmark'

UPPER_BOUND = 1000000

def palindromic_numbers(n)
  numbers = []
  1.upto(n) do |i|
    numbers << i if i.to_s.reverse == i.to_s and i.to_s(2).reverse == i.to_s(2)
  end
  return numbers
end

time = Benchmark.measure do
  puts 'The sum of all palindromic numbers in base 2 and 10 < 1,000,000'\
  " is #{palindromic_numbers(UPPER_BOUND).reduce(:+)}"
end

puts time