require "benchmark"

time = Benchmark.measure do
  i = 1
  j = 2
  next_num = 0
  sum = 2

  loop do
    next_num = i + j
    break if next_num > 4000000
    sum += next_num if next_num.even?
    i = j
    j = next_num
  end
  puts "The sum of the even-valued terms of the Fibonacci sequence whose values do not exceed four million is #{sum}"
end

puts "Time elapsed (in seconds): #{time}"

