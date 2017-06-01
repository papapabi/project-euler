require 'benchmark'

module Polygonal
  # A number is x triangular iff n = (sqrt(8*x + 1) - 1) /2
  # This method returns the index n of a number if it is triangular.
  # Derived from n*(n+1)/2 = x, with completing the square.
  def triangular?
    return false unless (8*self + 1).square?
    (Math.sqrt(8*self + 1) - 1).round / 2
  end

  # A number x is pentagonal iff n = (sqrt(24*x + 1) + 1) / 6
  # This method returns the index n of a number if it is pentagonal.
  # Derived from n*(3n-1)/2 = x, with completing the square.
  # Note: this is only sufficient for generalized pentagonal numbers.
  def pentagonal?
    return false unless (24*self + 1).square?
    (Math.sqrt(24*self + 1).round + 1) / 6
  end

  # A number x is pentagonal iff n = (sqrt(8*x + 1) + 1) / 6
  # This method returns the index n of a number if it is pentagonal.
  # Derived from n*(3n-1)/2 = x, with completing the square.
  def hexagonal?
    return false unless self.triangular?
    (Math.sqrt(8*self + 1).round + 1) / 6
  end

  # John Cook's method to check if an integer is a perfect square.
  # Perfect squares in base 16 end in 0, 1, 4, or 9.
  def square?
    l_hexdig = self & 0xF # Get the last digit of a number in hex (base-16).
    return false if l_hexdig > 9
    (l_hexdig != 2 && l_hexdig != 3 && l_hexdig != 5 &&
     l_hexdig != 6 && l_hexdig != 7 && l_hexdig != 8) ? true : false
  end
end

# Mix in our custom module to Ruby's Integer class.
class Integer
  include Polygonal
end


def tri_penta_hexa_number
  # Find the next triangular number after 40755
  # that is both pentagonal and hexagonal.
  ans = 40755
  loop do
    ans += 2 # We only need to check odd numbers
    break if ans.triangular? && ans.pentagonal? && ans.hexagonal?
  end
  ans
end

time = Benchmark.measure do
  ans = tri_penta_hexa_number
  puts "Triangular index: #{ans.triangular?}"
  puts "Pentagonal index: #{ans.pentagonal?}"
  puts "Hexagonal index: #{ans.hexagonal?}"
  puts "Number: #{ans}"
end
puts "Time elapsed (in seconds): #{time}"







