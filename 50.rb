require 'benchmark'
require 'prime'

BOUND = 1_000_000

# Objectives: 
# Find the sum of the longest string of consecutive primes under bound n.
# Make the algorithm general to handle max bounds up to 10**10.

# By longest, I mean the longest consecutive string that gives a sum below 
# max bound 'bound'.
# Returns an array of the elements of the consecutive prime string.
def longest_sum_of_consecutive_primes_below(bound)
  primes = generate_primes(bound)
  ans = find_consecutive_that_is_prime(primes) 
end

# Returns an array of consecutive primes based from a max bound.
# Note that this needs to be filtered such that the array reduces to a prime,
# AND has the most number of elements.
def generate_primes(bound)
  prime_generator = Prime.each
  primes = [] << prime_generator.next
  primes << prime_generator.next until primes.reduce(:+) >= bound
  primes.pop # The last one makes the resulting sum just a *little* over,
             # therefore we have to remove it. 
  primes
end

# Returns the most consecutive primes that folds to a prime.
def find_consecutive_that_is_prime(primes)
  # primes_left is the array the method uses to check the left tail of the array
  primes_left = primes.dup
  primes_right = primes.dup # Same here, but for the right tail of the array.
  loop do 
    primes_left.shift
    primes_right.pop
    # We're biased to the left tail because significantly smaller terms are 
    # removed at each iteration.
    return primes_left if primes_left.reduce(:+).prime?
    return primes_right if primes_right.reduce(:+).prime?
  end 
end

time = Benchmark.measure do
  longest_consecutive_primes = longest_sum_of_consecutive_primes_below(BOUND)
  ans = longest_consecutive_primes.reduce(:+)
  terms = longest_consecutive_primes.size
  puts "The prime, below #{BOUND}, that can be written as the sum of the most"\
      " consecutive primes is #{ans}"\
      " with #{terms} terms"
end
puts "Time elapsed (in seconds): #{time}"
