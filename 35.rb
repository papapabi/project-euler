require 'benchmark'
require 'set'
require 'prime'

# Finds all circular primes below integer n.
# Circular primes are numbers for which all rotations of the digits
# themselves are prime.
# Ex: 197 is a circular prime because 197, 971, 719 are themselves prime.
# args:
# - +n+ -> the exclusive upper bound of our search space
# returns:
# - an array of all circular primes in the range [1, n)
def circular_primes(n)
  circular_primes = Set.new
  Prime.each(n) do |prime|
    circular = true
    rotations = prime.to_s.length - 1
    digits = prime.to_s.chars.map(&:to_i)
    rotations.times do # For an n-digit number, there are n-1 rotations.
      digits << digits.shift # 'Rotate' the digits. Ex: 197 -> 971
      circular = false unless digits.reduce { |ac, i| ac*10 + i }.prime?
    end
    circular_primes << prime if circular
  end
  return circular_primes
end

time = Benchmark.measure do
  puts "There are #{circular_primes(1000000).length} circular primes < 1,000,000"
end
puts "Time elapsed (in seconds): #{time}"
