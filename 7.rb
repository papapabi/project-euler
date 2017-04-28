require "benchmark"

primes = [2] # initialize list of primes, starting with 2
i = 3 # current number

time = Benchmark.measure do
  until primes.size == 10001 do
    primes.each do |prime|
      if(i % prime == 0) # if the number is divisible by the current prime, check next i immediately
        break
      else
        if(prime == primes.last) # we hit the end of the list, checked all of the others preceding it
          primes.push(i) # ..we found a new prime!
        else
          next
        end
      end
    end
    i += 1
  end
end

puts "10001th prime: #{primes.last}"
puts "Time elapsed (in seconds): #{time}"



