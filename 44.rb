require 'benchmark'

def find_lowest_difference
  # Generates the pentagonal sequence where p(n) = n(3n−1)/2.
  # The first ten pentagonal numbers are:
  # 1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
  pentagonal = Enumerator.new do |yielder|
    n = 1;
    loop do
      yielder << n * (3*n - 1) / 2
      n += 1;
    end
  end

  # Same rationale as problem 42, initialize a Hash with its keys
  # as the pentagonal numbers that returns false for invalid keys
  # i.e., if the number isn't pentagonal.
  lookup_table = Hash.new(false)
  # Initialize the hash with the first 10000 pentagonal numbers.
  10000.times { lookup_table[pentagonal.next] = true }

  solution = []

  lookup_table.each_key do |key|
    found = false
    lookup_table.each_key do |key_2|
      break if found
      next if key == key_2
      sum = key + key_2
      difference = (key - key_2).abs
      # Add to solutions if both the sum and difference of the pentagonal
      # numbers are themselves pentagonal.
      if lookup_table[sum] && lookup_table[difference]
        solution << [sum, difference, [key, key_2]]
        found = true
        break # The first one encountered is guaranteed to be the lowest difference.
      end
    end
  end

  puts "Sum: #{solution.first[0]}"
  puts "Difference: #{solution.first[1]}"
  puts "Pentagonal pair: #{solution.first[2]}"
end

time = Benchmark.measure do
  find_lowest_difference
end
puts "Time elapsed (in seconds): #{time}"