def alphaIncreasing(num)
  num = num.to_i
  if(num >0 && num <5)
    a  = "a".."z"*num
    print a.to_a.join(",")
    puts
    puts "the number of elements of the array is: #{a.to_a.length}"
  else
    puts("Enter an integer greater than 0 and less than 5")
  end
end

puts "Enter the number of iterations"
num = gets.chomp

alphaIncreasing(num)
