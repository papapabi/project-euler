require 'benchmark'

UPPER_BOUND = 1000000

def largest_pandigital
  largest_pandigital = ""
  9.upto(UPPER_BOUND) do |num|
    next if num.to_s.chars.include? "0" # Pandigitals should only
                                        # include ints in [1, 9].
    # A number has repeated digits so we skip and check the next.
    next unless num.to_s.chars.uniq == num.to_s.chars
    test_string = num.to_s
    (2..9).each do |multiplier|
      repeated = false
      result = num * multiplier
      result_digits = result.to_s.chars
      break if result_digits.include? "0"
      break unless result_digits.uniq == result_digits
      result_digits.each do |char|
        if test_string.include? char
          repeated = true
          break
        end
      end
      test_string << result.to_s if not repeated
      break if test_string.length >= 9
    end
    largest_pandigital = test_string if test_string.length == 9 and test_string.to_i > largest_pandigital.to_i
  end
  return largest_pandigital
end

puts 'The largest 1-9 pandigital number that can be formed '\
     ' as the concatenated product of an integer and (1..9)'\
     " is #{largest_pandigital}"



