require 'benchmark'

# Finds the nth digit of Champernowne's constant.
# Champernowne's constant is an irrational decimal fraction created
# by concatenating all the positive integers:
# 0.12345678910111213141516....
# Ex: champernowne(12) -> 1
def champernowne(n)
  # Find which base-10 'power' n belongs to.
  # (if it is ones, tens, hundreds, thousands, etc)
  power = 0
  0.step do |d|
    if 9*(d+1) * 10**(d) >= n
      power = d
      break
    end
  end
  return n if power == 0
  digits = power + 1
  # Get all the numbers that we've passed through before reaching n.
  bounds = (0..(power-1)).map { |d| 9*(d+1) * 10**(d) }
  passed_indices = bounds.reduce(0, :+) # In the case where n is in [1, 9], bounds defaults to 0.
  normalized_position = n - passed_indices
  number = (10**power + (normalized_position - 1) / (digits)).to_s
  # This variable holds the index of the digit to be returned.
  normalized_index = normalized_position % digits
  return (normalized_index == 0 ? number[-1] : number[normalized_index-1]).to_i
end

time = Benchmark.measure do
  sigma = -> (a) { a.inject(:*) }
  puts 'The value of pi(d(10**n)) n : 0 -> 6 where d(n) is the nth digit of'\
  " Champernowne's constant and pi(n) is the sigma function is"\
  " #{sigma[(0..6).map { |c| champernowne(10**c) }]}"
end
puts "Time elapsed (in seconds): #{time}"




