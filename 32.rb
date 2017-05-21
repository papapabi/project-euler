require 'benchmark'

# Finds all products in the pandigital multiplicand/multiplier/product identity with the chosen amount of digits n.
# * for instance,  39 × 186 = 7254. This is a pandigital because all of the digits 1 through 9 appeared exactly once in the identity.
# * 453 x 6 = 2718 is also a pandigital with n = 8, digits in the interval [1, 8]
# args:
# - +n+ -> the desired max bound (from 1 to n) in the digits of the pandigital identity
# returns:
# - an array of products which satisfy the pandigital identity
# raises:
# - +ArgumentError+ -> if any value is nil or not in the interval [1, 9]
def pandigitals(n)
  raise ArgumentError, 'n is nil!' unless !!n
  raise ArgumentError, 'n can only be inside the interval [1, 9]' unless (1..9).include?(n)
  products = [] # An array of products that satisfy the pandigital identity for multiplication.
  tuples = [] # An array of arrays that represent a 3-tuple; the digits of the pandigital multiplicand/multiplier identity.

  (1..n).each do |i|
    multiplicand = i
    multiplier = ((n - i) / 2).floor
    product = n - (multiplier + multiplicand)
    tuples << [multiplicand, multiplier, product] if multiplier + multiplicand - 1 <= product # Products are only possible this way
  end

  tuples.each do |tuple|
    (10**(tuple[1]-1)..(10**tuple[1] - 1)).each do |multiplicand|
      next if multiplicand.to_s.chars.include?("0") # Immediately check the next if this current multiplicand has the number 0. Only ints in the interval [1, 9] are allowed.
      (10**(tuple[0]-1)..(10**tuple[0] - 1)).each do |multiplier|
        product = multiplicand * multiplier
        # Same as above, immediately check the next if the current product or multiplier has the digit 0.
        next if product.to_s.chars.include?("0") or multiplier.to_s.chars.include?("0")
        identity = [multiplicand.to_s.chars, multiplier.to_s.chars, product.to_s.chars].flatten # Gives an array of digits (represented as strings) of the pandigital identity.
        identity.sort! # Sort the array for easier checks if the identity does indeed have digits (1..n)
        products << product if identity.uniq.length == identity.length && identity == (1..n).to_a.map(&:to_s)
      end
    end
  end
  return products.uniq # Remove all duplicate products
end

time = Benchmark.measure do
  puts 'The sum of all products whose multiplicand/multiplier/product identity can be written as'\
  " a 1 through 9 pandigital is #{pandigitals(9).reduce(:+)}"
end
puts "Time elapsed (in seconds): #{time}"