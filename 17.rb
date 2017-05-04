require 'benchmark'
require 'humanize' # https://github.com/radar/humanize

time = Benchmark.measure do
  sum = 0
  1.upto(1000) do |i|
    sum += i.humanize.count("a-z")
  end
  puts "The sum of the letters of all the numbers (when written out in words) in the inclusive range [1, 1000] is #{sum}"
end

puts "Time elapsed (in seconds): #{time}"


