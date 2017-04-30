require 'benchmark'
time = Benchmark.measure do
  sum = 0

  File.open("string_13.dat").each do |line|
    sum += line.chomp.to_i
  end

  puts "The first 10 digits of the sum of one-hundred 50 digit numbers in string_13.dat is #{sum.to_s[0...10]}" # output first 10 digits, note that [0...10] is an exclusive range; (0..9) == (0...10)
end

puts "Time elapsed (in seconds): #{time}"
