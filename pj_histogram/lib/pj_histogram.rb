class Array
  def to_histogram()
    b = self.uniq
    c = {}
    b.each do |i|
    c[i]=0
      self.each do |j|
        if(i == j)
          c[i] = c[i]+1
        end
      end
    end
    c
   end
 end

 a = []
 loop do
   puts "Enter an input, enter a SPACE to end"
   val = gets.chomp
   x=Float(val) rescue false
   if (val != " ")
     if(x)
       if (val.to_f % 1 == 0)
         a.push(val.to_i)
       else
         a.push(val.to_f)
       end
     else
       a.push(val)
     end
   else
     break
   end

 end

puts "the histogram is #{a.to_histogram}"
