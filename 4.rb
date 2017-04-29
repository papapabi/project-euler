require "benchmark"

time = Benchmark.measure do
  num1 = 100
  num2 = 100
  palindrome = 0
  while num1 <= 999
    while num2 <= 999
      prod = num1 * num2
      palindrome = prod if(prod.to_s.reverse == prod.to_s && prod > palindrome)
      num2 += 1
    end
    num2 = num1 # to avoid redundancy
    num1 += 1
  end
  puts "The largest palindrome made from the product of 3 numbers is #{palindrome}"
end

puts "Time elapsed (in seconds): #{time}"




