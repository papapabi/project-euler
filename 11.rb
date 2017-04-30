require 'benchmark'

time = Benchmark.measure do
  ar = Array.new # The variable ar is a 'multi-dimensional' array that models the 20x20 grid given by string_11.dat
  File.open("string_11.dat").each do |line|
    ar.push(line.chomp.split.map(&:to_i)) # chomp removes trailing whitespaces, split splits by default on whitespace, the last method converts the string array to an int array
  end

  max_prod = 0

  # Checking horizontally and vertically
  ar.each_with_index do |col_val, i|
    break if i > ar.size - 4 # end checking on the element 3rd from the last
    col_val.each_with_index do |row_val, j|
      break if j > col_val.size -  4
      horizontal_test = ar[i][j] * ar[i][j+1] * ar[i][j+2] * ar[i][j+3]
      vertical_test = ar[i][j] * ar[i+1][j] * ar[i+2][j] * ar[i+3][j]
      max_prod = horizontal_test if horizontal_test > max_prod
      max_prod = vertical_test if vertical_test > max_prod
    end
  end

  # Diagonal checking (downwards)
  ar.each_with_index do |col_val, i|
    break if i > ar.size - 4
    col_val.each_with_index do |row_val, j|
      break if j > col_val.size - 4
      diagonal_test = ar[i][j] * ar[i+1][j+1] * ar[i+2][j+2] * ar[i+3][j+3]
      max_prod = diagonal_test if diagonal_test > max_prod
    end
  end

  # Diagonal checking (upwards)
  (ar.size-1).downto(0) do |i|
    break if i < 4
    0.upto(ar[0].size-1) do |j|
      break if j > ar[0].size-1 - 4
      diagonal_test = ar[i][j] * ar[i-1][j+1] * ar[i-2][j+2] * ar[i-3][j+3]
      max_prod = diagonal_test if diagonal_test > max_prod
    end
  end
  puts "The max product in the 20x20 grid is #{max_prod}"
end

puts "Time elapsed (in seconds): #{time}"






