require 'benchmark'
# Finds all 0 to 9 pandigital numbers with its substrings divisible by the
# consecutive prime numbers. If dn denotes the number's digit then it should
# satisfy the following properties:
# d2d3d4 is divisible by 2,
# d3d4d5 is divisible by 3,
# d4d5d6 is divisible by 5,
# d5d6d7 is divisible by 7,
# d6d7d8 is divisible by 11,
# d7d8d9 is divisible by 13, and
# d8d9d10 is divisible by 17.
def find_zero_to_nine_pandigitals
  solutions = []
  (0..9).to_a.permutation.each do |permutation|
    if permutation[1..3].join.to_i % 2 == 0 and
       permutation[2..4].join.to_i % 3 == 0 and
       permutation[3..5].join.to_i % 5 == 0 and
       permutation[4..6].join.to_i % 7 == 0 and
       permutation[5..7].join.to_i % 11 == 0 and
       permutation[6..8].join.to_i % 13 == 0 and
       permutation[7..9].join.to_i % 17 == 0
       solutions << permutation
    end
  end
  solutions
end

time = Benchmark.measure do
  puts "The sum of all 0-9 pandigitals satisfying the given property is
  #{(find_zero_to_nine_pandigitals.map { |el| el.join.to_i }).reduce(:+)}"
end
puts "Time elapsed (in seconds): #{time}"