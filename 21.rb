require 'benchmark'
require 'prime'

time = Benchmark.measure do
  # Reused divisor implemention from problem # 12
  # Finds all proper divisors of a given positive integer
  # Proper divisors are numbers less than n which divide evenly to n.
  # ex: proper_divisors_of(28) => [1, 3, 7, 21]
  #     proper_divisors_of(100) =>  [1, 2, 4, 5, 10, 20, 25, 50]
  def proper_divisors_of(num)
    primes, powers = num.prime_division.transpose # for num = 100; primes = [2, 5], powers = [2, 2]
    possible_exponents = powers.map {|i| (1..i).to_a} # possible exponents for num = 100; [[1,2], [1,2]]
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
    divisors.pop # Remove the number itself from the list of proper divisors.
    return divisors
  end

  lookup_table = { 1 => [1] } # Initialize a hash where the key is the integer
                              # and the value is the sum of its proper divisors.
  amicable_numbers = []
  MAX_BOUND = 10000
  (2...MAX_BOUND).each do |i|
    lookup_table[i] = proper_divisors_of(i).reduce(:+)
  end


  (2...MAX_BOUND).each do |i|
    next if i == lookup_table[i]
    val = lookup_table[i] # 284
    next unless lookup_table.key?(val)
    amicable_numbers.push(i).push(val) if i == lookup_table[val]
  end

  puts "The sum of all amicable numbers under 10,000 is #{amicable_numbers.uniq.reduce(:+)}"
end

puts "Time elapsed (in seconds): #{time}"



