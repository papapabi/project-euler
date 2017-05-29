require 'benchmark'
require 'prime'

# This is the largest valid bound for the prime pandigital because
# every other pandigital number bounds is divisible by 3, save for
# this and 4321.
LARGEST_PANDIGITAL = 7654321

# Returns true if an n-digit number has digits [1, n] appear
# at most once.
def pandigital?(n)
  digits = n.to_s.chars.map(&:to_i)
  # The correct digits for a number to be an n-pandigital.
  pandigital_digits = (1..digits.length).to_a
  return false if digits.include?("0") # Pandigitals do not contain 0.
  return (digits.sort == pandigital_digits)
end

def largest_pandigital
  largest_pandigital = 0
  Prime.each(LARGEST_PANDIGITAL) do |prime|
    next unless pandigital?(prime)
    largest_pandigital = prime if prime > largest_pandigital
  end
  return largest_pandigital
end

time = Benchmark.measure do
  puts "The largest pandigital prime is #{largest_pandigital}"
end
puts "Time elapsed (in seconds): #{time}"


