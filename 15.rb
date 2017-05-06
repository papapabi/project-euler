require 'benchmark'

time = Benchmark.measure do

  # This udpate to the solution uses dynamic programming instead of recursion, which took more than 5 hours to solve.
  COLUMNS = 20
  ROWS = 20

  # Leverage the fact that once you hit the rightmost column, you can only go down.
  # Likewise, for the bottommost row, you can only go right.
  grid = Array.new(ROWS) { Array.new(COLUMNS + 1) }
  grid.push(Array.new(COLUMNS + 1, 1))
  grid.map! do |grid_row|
    grid_row.pop
    grid_row.push(1)
  end

  (ROWS-1).downto(0) do |i|
    (COLUMNS-1).downto(0) do |j|
      grid[i][j] = grid[i+1][j] + grid[i][j+1] # The paths to a given point is the sum of the paths immediately below and to the right of it.
    end
  end

  puts "The 20x20 grid, according to the rules described by the problem statement,
  has #{grid.first.first} paths to the bottom right corner."
end

puts "Time elapsed (in seconds): #{time}"