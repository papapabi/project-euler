require 'benchmark'

# Get all factorions in radix 10.
# Factorions are natural numbers that equal the sum of the
# factorials of their decimal digits.
def factorions()
  # Initialize an array of factorials with index n giving the nth factorial.
  fac = (0..9).map { |i| if i.zero? then 1 else (1..i).reduce(:*) end  }

  # This is the lowest upper bound that can be found analytically.
  upper_bound = 1499999

  factorions = []

  1.upto(upper_bound).each do |i|
    next if i <= 2 # 1 and 2 should not be included, as stated by the problem.
    # The code is rather straightforward. Add all the factorials of the digits
    # of a number i. If the sum equals i, add i to the list of factorions.
    factorions << i if i == i.to_s.chars.map(&:to_i)
                            .reduce(0) { |sum, digit| sum + fac[digit] }
  end
  return factorions
end

time = Benchmark.measure do
  puts "The sum of all factorions is #{factorions.reduce(:+)}"
end
puts "Time elapsed (in seconds): #{time}"

