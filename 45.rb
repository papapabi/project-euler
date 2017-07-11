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
  def pentagonal?
    chk = 24*self + 1
    return false unless chk.square? && (integer_sqrt(chk) % 6 == 5)
    (Math.sqrt(24*self + 1).round + 1) / 6
  end

  # A number x is pentagonal iff n = (sqrt(8*x + 1) + 1) / 6
  # This method returns the index n of a number if it is pentagonal.
  # Derived from n*(3n-1)/2 = x, with completing the square.
  def hexagonal?
    return false unless self.triangular?
    (Math.sqrt(8*self + 1).round + 1) / 6
  end

  # Returns true if the receiver is a perfect square.
  def square?
    (integer_sqrt(self)**2 == self)
  end

  private
  # Returns the integer square of n, that is, ceil(sqrt(n)); verbosely:
  # An integer square root of n is the positive integer m which is the
  # greatest integer less than or equal to the square root of n.
  def integer_sqrt(n)
    if n < 2
      return n
    else
      small_candidate = integer_sqrt(n >> 2) << 1
      large_candidate = small_candidate + 1
      if large_candidate*large_candidate > n
        return small_candidate
      else
        return large_candidate
      end
    end
  end
end

# Mix in our custom module to Ruby's Integer class.
class Integer
  include Polygonal
end


def tri_penta_hexa_number
  # Find the next triangular number after 40755
  # that is both pentagonal and hexagonal.
  i, ans = 143, 0
  loop do
    i += 1
    ans = i * (2*i - 1)
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
