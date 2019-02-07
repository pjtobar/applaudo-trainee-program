def mean(a)
  len =  a.length.to_f
  sum = 0
  a.each do |i|
    sum = sum + i
  end
  m = sum/len
  m
end

def median(a)
  len = a.length.to_i
  for i in(0..len-1)
    for j in(0..len-1)
      if (a[i] < a[j])
        aux = a[i]
        a[i] = a[j]
        a[j] = aux
      end
    end
  end

  if (len.to_i % 2) == 0
    m = (a[(len/2)-1].to_f+a[len/2].to_f)/2
  else
    m = a[len/2]
  end
  m
end

def mode(a)
    b = a.uniq
    lena = a.length
    lenb = b.length
    c = []
    for i in(0..lenb-1)
      c[i]=0
      for j in(0..lena-1)
        if(b[i] == a[j])
          c[i] = c[i]+1
        end
      end
    end

    base = c[0]
    pos = 0
    for k in(0..lenb-2)
      if (base<=c[k+1])
        if(b[pos]<b[k+1])
          pos = k+1
          base = c[k+1]
        end
      end
    end
    b[pos]
end

a = []
loop do
  puts "Enter a number, press any letter to end"
  val = gets.chomp
  x=Float(val) rescue false
  if(x)
    a.push(val.to_f)
  else
    break
  end
end


#a = [3,6,4,7,5,2,3,6,6,2]
puts "The mean is: #{mean(a)}"
puts "The median is: #{median(a)}"
puts "The mode is: #{mode(a)}"
