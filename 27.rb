require 'prime'
require 'benchmark'

# This Project Euler problem helped me understand the ins-and-outs of Ruby scoping
# for block variables. Also, the use of hashes as method arguments.
# Ruby stores an identifier even if the code wasn't executed logically.
# if false
#   name = "Josh"
# end
# defined?(name) => true, local variable!!

time = Benchmark.measure do
  @primes = 0 # This holds the maximum number of primes for consecutive values of n.

  # Search for the coefficients 'a' and 'b' that gives the maximum amount of consecutive primes in the expression n^2 + a*n + b, with n starting at 0.
  # It takes two args of required hashes with keys a_sign and b_sign,
  # and the value corresponding to which direction we want to search coefficients a and b in.
  # Use as: search(a_sign: positive, b_sign: positive)
  # This method returns a hash with keys :a, :b, :primes with their values respectively.
  def search(a_sign:, b_sign:)
    if a_sign == "positive"
      a_bound = 1000
      step = 1
    end
    if a_sign == "negative"
      a_bound = -1000
      step = -1
    end

    test_a = 0
    test_b = 0
    max_primes = 0

    0.step(a_bound, step) do |a| # Search for the 'a' coefficient, while a < 1000. Use a block-local variable a.
      Prime.each(1000) do |b| # Search for the 'b' coefficient, while b < 1000.
        b = -(b) if b_sign == "negative" # Flip the sign of the prime if we wanted to search for b in [-1000, 0]
        p = 0 # How many primes 'expression' produces.
        0.step do |n| # The loop for checking if the expression does indeed produce
                      # consecutive primes starting at 0.
          expression = n ** 2 + a*n + b
          break unless expression.prime?
          p += 1 # another prime was found
        end # end step loop

        if p > max_primes
          max_primes = p
          test_a = a
          test_b = b
        end

      end # end prime loop; b
    end # end 'a' loop
     # Returns a hash with keys :a, :b, and max_primes with their values respectively.
    {:a => test_a, :b => test_b, :primes => max_primes}
  end

  values = ["positive", "negative"]
  permutations = values.repeated_permutation(2).to_a
  permutations.each do |permutation|
    particular_case = search(a_sign: permutation[0], b_sign: permutation[1])
    if particular_case[:primes] > @primes
      @primes = particular_case[:primes]
      @a = particular_case[:a]
      @b = particular_case[:b]
    end
  end

  puts 'The product of the coefficients a and b for the quadratic expression'\
  'that produces the maximum number of primes for consecutive values of n, starting at n = 0' +
  " is #{@a*@b}"
end

puts "Time elapsed (in seconds): #{time}"



