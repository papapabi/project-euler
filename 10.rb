# this solution implements the sieve of eratosthenes
# https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
require 'benchmark'

time = Benchmark.measure do
  MAX_NUM = 2000000
  UPPER_BOUND = Math.sqrt(MAX_NUM).to_i # the upper_bound is the prime where the sieve terminates; as all smaller primes would have crossed out all composites in the list
  list = [false, false, true] # make an array of booleans, indexed from (2 to n) where true is for primes and false is for composites
  list.fill(true, list.size, MAX_NUM-2) # fill in the value 'true' for all numbers > 2, initially (this op is somewhat costly)
  # the array size after this operation will be 20000001, but the resulting array will be setup for 'properly-indexed' elements
  # for instance, [0, 1, 2] => [false, false, true]: where 0 is not a prime, 1 is not a prime, 2 is a prime, and so on


  (2..UPPER_BOUND).each do |i|
    if(list[i] == true)
      (i**2..MAX_NUM).step(i).each do |j|
        list[j] = false
      end
    end
  end
  puts "The sum of all primes < 2,000,000 is #{list.each_index.select { |i| list[i] == true }.inject(:+)}"
end
puts "Time elapsed (in seconds): #{time}"




