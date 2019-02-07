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
