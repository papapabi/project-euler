require 'benchmark'
require 'bigdecimal'
require 'prime'
require 'byebug'
time = Benchmark.measure do
  num = 0
  longest = 0
  recurrence_string = []

  # If d is a composite, 1 / d, is nonrepeating, due to the nature of decimal numbers.
  # Given a bit of research, it can be determined that Fermat's little theroem can be of use.
  # A prime d, given 1 / d, gives UP TO d - 1 repeating decimal digits.

  # This heuristic approach uses the remainder per iteration, rather than dealing with the number in decimal itself
  # due to floating-point imprecisions.
  # On my machine 1 / 3 is 0.333333333333334545638, ridiculous.
  (7...1000).each do |d| # Triple dot syntax for a half-closed interval. [6, 1000)
                         # Start at the first prime from [1, 10] with the longest recurring sequence, 7.
    next unless d.prime?
    remainders = []
    recurrence = []
    divisor = 10
    loop do # loop is actually a function that takes in a code block. (do..end)
      remainder = divisor % d
      break if remainders.include?(remainder) # We already saw this remainder before, implying recurrence.
      quotient = divisor / d
      remainders << remainder
      recurrence << quotient
      divisor = remainder * 10
    end
    if recurrence.length > longest
      longest = recurrence.length
      num = d
      recurrence_string = recurrence
    end
  end # end each

  puts "The number d in [1, 1000) for which 1 / d contains the longest recurring cycle is #{num}" +
  " with a recurring sequence of length #{recurrence_string.length}, #{recurrence_string.join}."
end

puts "Time elapsed (in seconds): #{time}"
