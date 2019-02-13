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
# a = 1
#  puts "hola pablo" if a == 1
#
# def call_block
#   puts "Start of method"
#   yield
#   yield
#   puts "End of method"
# end
# call_block {
#   puts "In the block"
#   puts "second"
#   }
#
# class BookInStock
#   attr_reader :isbn
#   attr_accessor :price
#   def initialize(isbn, price)
#     @isbn = isbn
#     @price = Float(price)
#   end
# end
# b1 = BookInStock.new("isbn111", 3)
# b1.price = "pablo"
# p  b1.price
# b2 = BookInStock.new("isbn2", 3.14)
# p b2
# b3 = BookInStock.new("isbn3", "5.67")
# p b3

#
# def my_method
#   puts "before proc"
#   my_proc = proc do
#     puts "inside proc"
#     return
#   end
#   my_proc.call
#   puts "after proc"
# end
#
# my_method

# def show_regexp(string, pattern)
#   match = pattern.match(string)
#   if match
#     puts "#{match.pre_match}->#{match[0]}<-#{match.post_match}"
#   else
#     puts "no match"
#   end
# end
#
# show_regexp('bananananananana nanan', /(an)+/)

# require 'open-uri'
# page = "podcasts"
# file_name = "#{page}.html"
# web_page = open("http://pragprog.com/#{page}")
# output = File.open(file_name, "w")
# begin
# while line = web_page.gets
# output.puts line
# end
# output.close
# rescue Exception
# STDERR.puts "Failed to download #{page}: #{$!}"
# output.close
# File.delete(file_name)
# raise
# end

# begin
# a = b
# rescue => err
#   puts err.message
# end
# puts 'hola'

while line =  gets
  puts line
end

File.open("testfile") do |file|
while line = file.gets
puts line
end
end

# File.open("testfile") do |file|
#   while line = file.gets
#     puts line
#   end
# end
