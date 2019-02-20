require_relative 'vehicle'
require_relative 'car'
require_relative 'truck'
require_relative 'store'
require_relative 'extra'

names = ['Radio', 'AC', 'Sunroof', 'Leather Seats', 'Power Windows']
prices = [200, 300, 400, 500, 600]


vehicles = Store.new
extra = Extra.new(names, prices)



vehicles.create_vehicles
extra.create_extra


vehicles.all_vehicls.each do |i|
  puts i.id
  puts i.type
  puts i.color
  puts i.brand
  puts i.price
  puts i.wheels
  puts '-------------------------------------'
end

extra.all_extra.each do |i|
  puts i.id_extra
  puts i.price
  puts i.name
  puts '-------------------------------------'
end
