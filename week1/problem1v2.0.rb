def alphaIncreasing(first,last)
  a  = "a".."z"
  b = []
  if (first > last)
    aux = first
    first = last
    last =  aux
  end
  a.to_a.each do |ext|
    if (first <= ext && last >= ext )
      a.to_a.each do |int|
        b.push(ext + int)
      end
    end
  end
if(!aux)
  print b.join(",")
else
  print b.reverse.join(",")
end
  puts
end

puts "Enter the start letter"
first = gets.chomp
puts "Enter the final letter"
last = gets.chomp

alphaIncreasing(first,last)
