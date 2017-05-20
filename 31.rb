require 'benchmark'

S = [1, 2, 5, 10, 20, 50, 100, 200]

# The question makes us find all possible ways of making change of a given value,
# N using the Coin Change algorithm.
# http://www.algorithmist.com/index.php/Coin_Change

# A recursive implementation of the Coin Change algorithm.
# Params:
# - +n+ -> the amount of money you want to partition, in cents
# - +m+ -> the set of denominations you wish to subdivide n with
def count_recursive(n, m)
  if n < 0 or m < 0
    return 0
  end
  if n == 0
    return 1 # We found one solution!
  end
  return count_recursive(n, m-1) + count_recursive(n - S[m], m)

end

time = Benchmark.measure do
  puts "There are #{count_recursive(200, 7)} ways you can make change out of 200 pence, given English currency."
end
puts "Time elapsed (in seconds): #{time}"
