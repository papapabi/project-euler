require 'benchmark'


time = Benchmark.measure do
  @paths = 0
  # Solves a given 2D array according to the rules of Problem #15.
  # Paths can only move right or down, and the end goal of a path is to
  # reach the bottom right corner.
  #
  # It should be noted that the Array#transpose method runs at O(m * n) time,
  # which stupidly slow for big grids.

  ar = Array.new(20) { Array.new(20, 0) }

  def solve(ar)
    return @paths += 1 if ar.first.length == 1
    @paths += 1 ; solve(ar.drop(1)) if ar.length > 1 # Move downwards if we still have more than 1 row
    @paths += 1 ; solve(ar.transpose.drop(1).transpose) if ar.transpose.length > 1 # Move rightwards if we still have more than 1 col
  end

  puts "The 20x20 grid, according to the rules described by the problem statement,
  has #{solve(ar)} paths to the bottom right corner."
end

puts "Time elapsed (in seconds): #{time}"