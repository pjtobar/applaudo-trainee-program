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

a = [1,1,1,2,3,3,3,6,6,3,"pablo","pablo"]
puts "the histogram is #{a.to_histogram}"
