require 'benchmark'

time = Benchmark.measure do
  year = 1901
  sundays = 0
  cur_day = 6 # Every 7th day is a Sunday, start from the first sunday of the year 1900.
                  # Sun, January 6, 1901
  first = true

  while year <= 2000
    (1..12).each do |i| # 1 for January, 2 for Feb, etc
    days =
      if [4, 6, 9, 11].include?(i)
        30
      elsif i == 2
        if year % 4 == 0
          29
        else
          28
        end
      else
        31
      end

    loop do
      cur_day += 7 unless first
      break if cur_day > days
      sundays += 1 if cur_day == 1
      first = false
    end
    cur_day %= days
    first = true
    end

    year += 1
  end

  puts "There are #{sundays} Sundays that fell on the first of the month during the
  twentieth century (1 Jan 1901 to 31 Dec 2000)"
end

puts "Time elapsed (in seconds): #{time}"





