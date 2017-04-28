require "benchmark"

num = File.read("string_8.dat").delete("\n").each_char.map(&:to_i) # converts the number (loaded from a file) into an integer array
cur_first_i = 0 # index of the currently-checked first char, [0, 12] -> [1, 13] -> ...
largest_product = 0

time = Benchmark.measure do
  while cur_first_i <= num.length - 12 do
    test = num[cur_first_i..cur_first_i+12].inject(1) { |result, digit| result = result * digit }
    largest_product = test if test > largest_product
    cur_first_i += 1
  end
end

puts "Largest consecutive 13-digit product: #{largest_product}"
puts "Time elapsed (in seconds): #{time}"

