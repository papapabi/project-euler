require 'benchmark'
require 'prime'

# General algorithm for finding n consecutive numbers to have n distinct prime
# factors each. 
def distinct_primes(n)
  2.step do |i|
    nums = []
    tuples = [] # Each element is a 2-tuple of [prime, factor]
    j = i
    n.times do 
      nums << j
      tuples << j.prime_division 
      j += 1
    end
    next unless digits_equal(tuples, n)
    return nums if distinct_factors(tuples)
  end
end

# Returns true if the factors of each element in tuples are unique.
def distinct_factors(tuples)
  accumulator = []
  tuples.each { |el| accumulator << el }
  return accumulator.uniq == accumulator
end

# Returns true if the integers in tuples fulfill the condition
# n consecutive integers == n distinct prime factors for each integer.
def digits_equal(tuples, n)
  tuples.each do |pair|
    return false unless pair.size == n
  end
  return true
end

time = Benchmark.measure do
  puts "The first number of the first 4 consecutive integers to have 4 distinct"\
    " prime factors each is #{distinct_primes(4).first}"
end
puts "Time elapsed (in seconds): #{time}"
