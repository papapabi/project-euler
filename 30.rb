require 'benchmark'

# Returns all perfect digital invariants with the desired exponent.
# A PDI is a number that is the sum of its own digits each
# raised to an arbitrary power.
# The difference with narcissistic numbers is that PDIs need not
# have digits == exponent.
def pdi(power)
  return nil if power == 1 # There are no PDIs in p = 1.
  pdi = []
  upper_bound = 9**power*6 # Stop checking at the largest sum of 6 digits in base 10 raised to 5.
  (10...upper_bound).each do |i| # Skip all one-digit numbers.
    pdi << i if i == i.to_s.chars.map(&:to_i).map{ |i| i**power }.reduce(:+)
  end
  return pdi
end

time = Benchmark.measure do
  puts "The sum of all numbers that can be written as the sum of fifth powers of their digits is #{pdi(5).reduce(:+)}"
end
puts "Time elapsed (in seconds): #{time}"
