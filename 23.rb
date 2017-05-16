require 'benchmark'
require 'prime'

time = Benchmark.measure do
  # Reused proper divisor implemention from problem # 21
  # Finds all proper divisors of a given positive integer.
  # Proper divisors are numbers less than n which divide evenly to n.
  # ex: proper_divisors_of(28) => [1, 3, 7, 21]
  #     proper_divisors_of(100) =>  [1, 2, 4, 5, 10, 20, 25, 50]
  #     proper_divisors_of(1) => breaks; by definition, 1 should have no proper divisors.
  def proper_divisors_of(num)
    primes, powers = num.prime_division.transpose # for num = 100; primes = [2, 5], powers = [2, 2]
    possible_exponents = powers.map {|i| (1..i).to_a} # possible exponents for num = 100; [[1,2], [1,2]];
    divisors = [1] # force 1 as a divisor since we don't compute prime^0

    # Special case for the first prime
    possible_exponents.first.each do |exponent|
      divisors.push(primes.first ** exponent)
    end

    # Drop since we're done with them
    primes = primes.drop(1)
    possible_exponents = possible_exponents.drop(1)
    primes.each_with_index do |prime, index|
    last_index = divisors.length - 1  # so we can operate on the 'old' divisors array
      possible_exponents[index].each do |exponent| # only use that prime's corresponding exponents
        new_divisor = prime ** exponent
          for i in 0..last_index
            divisors.push(divisors[i] * new_divisor)
          end
      end
    end
    divisors.pop # Remove the number itself from the list of divisors to make the set 'proper'
    return divisors
  end

  UPPER_BOUND = 20161 # Good ole' reliable (https://en.wikipedia.org/wiki/Abundant_number)
                      # says that every integer greater than this value can be written as the
                      # sum of two abundant numbers.

  abundant_numbers = [] # A list of all abundant numbers < 20161.
  marked = [] # All numbers < 20161 that are sums of two abundant numbers.
              # Since we're looking for numbers that are NOT sums of two abundant numbers, we'll use
              # this set to disjoint with (1..UPPER_BOUND); local variable 'unmarked'
  unmarked = (1..UPPER_BOUND).to_a

  (2..UPPER_BOUND).each do |i|
    # A number is abundant if the sum of its proper divisors is greater than itself.
    abundant_numbers << i if proper_divisors_of(i).reduce(:+) > i
  end

  # Generate pairs of two abundant numbers, breaking each time a pair is greater than
  # 20161. There's no point in checking after this precisely because we're generating a
  # list of integers NOT expressible by the sum of 2 abundant numbers.
  abundant_numbers.each do |num1|
    abundant_numbers.each do |num2|
      sum = num1 + num2
      break if sum > UPPER_BOUND
      marked << sum
    end
  end

  marked.uniq! # remove all duplicates; the loop above doesn't distinguish between [a+b] and [b+a].
  disjoint = (marked + unmarked) - (marked & unmarked) # All integers not expressible by the sum of two abundant numbers!
  puts "The sum of all positive integers which cannot be written as a sum of two abundant numbers is #{disjoint.reduce(:+)}"
end

puts "Time elapsed (in seconds): #{time}"