require 'benchmark'

dc_fractions = []

(10..99).each do |numerator|
  next if numerator.to_s.chars.include?("0")
  (numerator..99).each do |denominator|
    next if denominator.to_s.chars.include?("0")
    fraction = Rational(numerator, denominator)
    next if fraction >= 1
    num_digits = numerator.to_s.chars.map(&:to_i) # Get the digits of the numerator as an array of ints.
    dnm_digits = denominator.to_s.chars.map(&:to_i) # Same thing with the denominator.
    c1_reduced = Rational(num_digits[0], dnm_digits[1]) # Either the numerator's ones digit gets canceled along with the denominator's tens digit, or
    c2_reduced = Rational(num_digits[1], dnm_digits[0]) # the numerator's tens digit gets cancled along with the denominator's ones digit.
    dc_fractions << fraction if c1_reduced == fraction and num_digits[1] == dnm_digits[0]
    dc_fractions << fraction if c2_reduced == fraction and num_digits[0] == dnm_digits[1]
  end
end

time = Benchmark.measure do
  puts "The denominator, in simplest terms, of the product of the 4 digit-canceling fractions is #{dc_fractions.reduce(:*).denominator}"
end

puts "Time elapsed (in seconds): #{time}"