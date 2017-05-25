require 'benchmark'
require 'prime'

# Returns all two-sided truncatable primes as an array.
def t_primes()
  t_primes = []
  10.step do |i| # Skip all one-digit numbers.
    next unless i.prime?
    digits = i.to_s.chars
    cp_digits = digits.dup # Copy the digits as we will operate on
                           # this array twice.
    lftrt = rtlft = digits.length
    # A number is a left-truncatable prime if all its leading digits
    # (that is, the digit in the most significant place), when succ-
    # essively removed, all resulting numbers are prime.
    lftrt.times do
      cp_digits.shift
      break unless cp_digits.join.to_i.prime?
    end
    # If cp_digits still has elements in it, that means those elements
    # weren't prime themselves.
    next unless cp_digits.length.zero?
    cp_digits = digits.dup
    rtlft.times do
      cp_digits.pop
      break unless cp_digits.join.to_i.prime?
    end
    next unless cp_digits.length.zero?
    t_primes << i # Found a two-sided truncatable prime!
    break if t_primes.size == 11
  end
  return t_primes
end

time = Benchmark.measure do
  puts "The sum of all two-sided primes is #{t_primes.reduce(:+)}"
end
puts "Time elapsed (in seconds): #{time}"