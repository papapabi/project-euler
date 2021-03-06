# find a + b + c = 1000
# where a < b < c, a^2 + b^2 = c^2

require "benchmark"
  time = Benchmark.measure do
    a = 1
    b = 0
    c = 0
    while a < 1000/3 do
      b = a
      while b < 1000/2 do
        c = 1000 - a - b
        if a ** 2 + b ** 2 == c ** 2
          found = true
          break
        end
        b += 1
      end
      break if(found)
      a += 1
    end
    puts "a: #{a}, b: #{b}, c: #{c}"
    puts "Product: #{a*b*c}"
end

puts "Time elapsed (in seconds): #{time}"


