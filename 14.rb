require 'benchmark'

time = Benchmark.measure do
  def collatz_sequence(num, length = 1) # the starting number is inclusive with the count
    if (num == 1)
      return length
    else
      length += 1
      num.even? ? collatz_sequence(num / 2, length) : collatz_sequence(3 * num + 1, length)
    end
  end

  longest_sequence = 0
  num = 0

  1.upto(1000000) do |i|
    cur_sequence = collatz_sequence(i) # so we don't have to evaluate twice
    if cur_sequence > longest_sequence
      longest_sequence = cur_sequence
      num = i
    end
  end
  puts "The longest collatz sequence with starting n < 1000000 is #{longest_sequence} with n = #{num}"
end

puts "Time elapsed (in seconds): #{time}"
