require_relative 'vehicle'
require_relative 'car'
require_relative 'truck'
require_relative 'store'

store = Store.new

store.create_vehicles


store.all_vehicls.each do |i|
  puts i.id
  puts i.type
  puts i.color
  puts i.brand
  puts i.price
  puts i.wheels
  puts '-------------------------------------'
end
