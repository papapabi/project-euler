require 'benchmark'

time = Benchmark.measure do
  # 1, 1, 2, 3, 5, 8, 13, 21 ad infinitum
  fibonacci = Enumerator.new do |yielder|
    a = b = 1
    loop do
      yielder << a
      a, b = b, a + b
    end
  end

  i = 1

  loop do
    fib_num = fibonacci.next
    break if fib_num.to_s.length == 1000
    i += 1
  end

  puts "The index of the first term in the Fibonacci sequence to contain 1000 digits is #{i}"
end

puts "Time elapsed (in seconds): #{time}"