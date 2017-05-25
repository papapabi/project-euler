require 'benchmark'
require 'prime'

t_primes = []

10.step do |i|
  next unless i.prime?
  digits = i.to_s.chars
  cp_digits = digits.dup
  lftrt = rtlft = digits.length
  lftrt.times do
    cp_digits.shift
    break unless cp_digits.join.to_i.prime?
  end
  next unless cp_digits.length.zero?
  cp_digits = digits.dup
  rtlft.times do
    cp_digits.pop
    break unless cp_digits.join.to_i.prime?
  end
  next unless cp_digits.length.zero?
  t_primes << i
  break if t_primes.size == 11
end

puts t_primes.reduce(:+)