require 'benchmark'
require 'prime'

time = Benchmark.measure do
  lower_bound = 0

  # Finds all divisors of a given positive integer
  # ex: divisors_of(28) => [1,3,7,21]
  #     divisors_of(100) =>  [1, 2, 4, 5, 10, 20, 25, 50, 100]
  def divisors_of(num)
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
    return divisors.uniq
  end

  # 1, 3, 5
  triangle_sequence = Enumerator.new do |yielder|
    next_number = 0
    triangle_number = 0
    loop do
      next_number += 1
      triangle_number += next_number
      yielder.yield triangle_number
    end
  end

  ans = 0

  triangle_sequence.next # skip 1
  loop do
    ans = triangle_sequence.next
    break if divisors_of(ans).length > 500
  end
  puts "The first triangle number to have over five hundred divisors is #{ans}"
end

puts "Time elapsed (in seconds): #{time}"






