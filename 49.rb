require 'benchmark'
require 'prime'

# Main solving logic.
def find_prime_permutations
  primes = primes_in_interval(1000, 9999)
  ans = find_arithmetic_sequence(primes) 
  ans.join
end

# Returns an array of all primes in the ascending (a < b) closed interval [a, b].
def primes_in_interval(a, b)
  primes = []
  Prime.each do |prime|
    next if prime < a
    break if prime > b
    primes << prime
  end
  primes
end

# Returns the arithmetic sequence of the three primes with cd 3330.
def find_arithmetic_sequence(primes)
  ans, cd = 0, 3330
  primes.each do |prime|
    next if prime == 1487 # Given.
    its_digits = prime.to_s.chars.sort
    second_term = prime + cd
    next unless (primes.include? second_term) &&
      its_digits == second_term.to_s.chars.sort
    third_term = second_term + cd
    if (primes.include? third_term) && 
      its_digits == third_term.to_s.chars.sort
      ans = [prime, second_term, third_term]
      break
    end
  end
  ans
end

time = Benchmark.measure do
  puts "The 12-digit number formed by concatenating said sequence is "\
       "#{find_prime_permutations}"
end
puts "Time elapsed (in seconds): #{time}"
