# def test(t)
#   puts "prueba de impresion #{t.capitalize}"
# end
#
# test("hello world")

# today =  Time.now
#
# if today.saturday?
#   puts "Go to work :'("
# else
#   puts "you are free"
# end
# puts today
a = 1
 puts "hola pablo" if a == 1

def call_block
  puts "Start of method"
  yield
  yield
  puts "End of method"
end
call_block {
  puts "In the block"
  puts "second"
  }

class BookInStock
  attr_reader :isbn
  attr_accessor :price
  def initialize(isbn, price)
    @isbn = isbn
    @price = Float(price)
  end
end
b1 = BookInStock.new("isbn111", 3)
b1.price = "pablo"
p  b1.price
b2 = BookInStock.new("isbn2", 3.14)
p b2
b3 = BookInStock.new("isbn3", "5.67")
p b3
