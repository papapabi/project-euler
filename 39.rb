require 'benchmark'
require 'bigdecimal'

# Finds the perimeter p that has a maximal amount of integral solutions
# to the pythagorean identity c^2 = a^2 + b^2.
def max_solutions(n)
  max_solutions = 0
  perimeter = 0
  1.upto(n) do |c|
    solutions = [] # All valid integral solutions for this part. perimeter c.
    1.upto(c-1) do |b|
      a = BigDecimal(c/2) * BigDecimal(c - 2*b)/BigDecimal(c - b)
      next if a.to_i != a or a <= 0 # Only integral solutions are allowed.
      solutions << [c, b, a]
    end
    if solutions.length > max_solutions
      perimeter = c
      max_solutions = solutions.length
    end
  end
  return perimeter
end

time = Benchmark.measure do
  puts "The perimeter p<=1000 which gives the max integral solutions is #{max_solutions(1000)}"
end
puts "Time elapsed (in seconds): #{time}"
