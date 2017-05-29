require 'benchmark'

# Returns true if the given char arg is a letter.
def letter?(lookAhead)
  lookAhead =~ /[[:alpha:]]/
end

# Finds all triangle words inside the given file.
def triangle_words
  # Generates the triangle sequence where t(n) = 1/2(n)(n+1).
  # The first 10 triangle numbers are:
  # 1, 3, 6, 10, 15, 21, 28, 36, 45, 55.
  triangle = Enumerator.new do |yielder|
  n = 1
  loop do
    yielder << n * (n + 1) / 2
    n += 1
    end
  end

  # Initialize a new hash that returns false on invalid keys.
  lookup_table = Hash.new(false)
  # Put the first 1000 triangle numbers in our lookup table as keys.
  # This is probably overkill, but it's better to be safe than sorry lel
  # If accessed with a key that isn't a triangle, it returns false.
  1000.times { lookup_table[triangle.next] = true }

  triangle_words = []

  File.foreach("p042_words.txt", ",") do |word|
    # Get the values of the letters according to their position in the
    # alphabet, using the letter's ASCII value.
    word.upcase! # In case there are lowercase letters in the file.
    characters = word.chars.delete_if { |char| not letter?(char) }
    values = characters.map { |char| char.ord - 64 }
    triangle_words << word if lookup_table[values.inject(:+)]
  end
  return triangle_words
end

time = Benchmark.measure do
  puts "There are #{triangle_words.length} triangle words in the file"
end
puts "Time elapsed (in seconds): #{time}"

