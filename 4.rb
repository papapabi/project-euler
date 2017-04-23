$num1 = 100
$num2 = 100
$pal1 = 0
$pal2 = 0
$palindrome = 0

until $num1 > 999 do
  until $num2 > 999 do
    $ans = $num1 * $num2
    if($ans.to_s.reverse == $ans.to_s)
      if($ans > $palindrome)
        $palindrome = $ans
        $pal1 = $num1
        $pal2 = $num2
      end
    end
    $num2 += 1
  end
  $num2 = $num1 # to avoid redundant checking
  $num1 += 1
end

puts "The largest palindrome is: #{$palindrome}"
puts "First number: #{$pal1}"
puts "Second number: #{$pal2}"


