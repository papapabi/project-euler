require 'benchmark'
require 'prime'

prime_generator = Prime.each
primes = [] << prime_generator.next
ans = 0


# Reused square? and integer_sqrt(n) methods from problem 45
# Returns true if the receiver is a perfect square.
def is_square(n)
	(integer_sqrt(n)**2 == n)
end

# Returns the integer square of n, that is, ceil(sqrt(n)); verbosely:
# An integer square root of n is the positive integer m which is the
# greatest integer less than or equal to the square root of n.
def integer_sqrt(n)
  if n < 2
    return n
  else
    small_candidate = integer_sqrt(n >> 2) << 1
    large_candidate = small_candidate + 1
    if large_candidate*large_candidate > n
      return small_candidate
    else
      return large_candidate
    end
  end
end

time = Benchmark.measure do
  1.step do |i| # default Numeric#step for infinite looping
    found = false
    1.upto(i) do |j|
      odd_composite = (2*i + 1)*(2*j + 1) # sequence formula from oeis.org
      primes << prime_generator.next until primes.last > odd_composite
      primes.reverse_each.with_index do |prime, index|
        intermediary_result = odd_composite - prime
        next if intermediary_result < 0
        break if is_square(intermediary_result/2)
        if index == primes.size - 1
          found = true
          ans = odd_composite
        end
      end 
    end
    break if found
  end
puts "The smallest odd composite that cannot be written as as sum of a prime
and twice a square is #{ans}"
end
puts "Time elapsed (in seconds): #{time}"
