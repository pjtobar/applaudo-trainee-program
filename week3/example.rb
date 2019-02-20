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

vehicle = []
loop do
  puts 'Enter vehicle id to add extras'
  id_vehicle = gets.chomp
  vehicle = vehicles.select_vehicle id_vehicle
break if vehicle != []
end

puts "Enter id of the extras you want to add"
extras_arr=[]
add_more = 'Y'

loop do
  if (add_more == 'Y')
    id_extra = gets.chomp
    if extra.exits(id_extra) == []
      puts 'Extra not found, try again'
    elsif extras_arr.include? id_extra
      puts 'the extra has already been added, try again'
    else
      extras_arr << id_extra
      puts 'Do you want to add other extra? press Y/N'
      add_more = gets.chomp
      if add_more == 'Y'
        puts 'Enter id of the extras you want to add'
      end
      while add_more != 'Y' && add_more != 'N'
        puts 'Please enter Y if you want to add another extra o enter N to finish'
        add_more = gets.chomp
      end
    end
  else
    break
  end
end

total_extra = 0
extras_arr.each do |i|
  extra_select = extra.all_extra.select {|j|j.id_extra.to_s == i.to_s}
  total_extra += extra_select[0].price
end

total =  total_extra + vehicle[0].price
puts "Total: #{total}"
