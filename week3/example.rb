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

option = nil

while option != 'Exit'

  puts '----------------------------------------------------------'
  puts 'WELCOME TO STORE'
  puts 'Main Menu'
  puts '----------------------------------------------------------'
  puts 'Select an option'
  puts '1- Show available vehicles'
  puts '2- Show available Extras'
  puts '3- Add a vehicle to the store'
  puts '4- Remove a vehicle from the store'
  puts '5- Quote a vehicle'
  puts '6- Exit'
  option = gets.chomp.to_i

  case option
  when 1
    vehicles.all_vehicls.sort_by{|i| i.type}.each do |i|
      puts '-------------------------------------'
      puts "ID: #{i.id}"
      puts "Type: #{i.type}"
      puts "Color: #{i.color}"
      puts "Brand: #{i.brand}"
      puts "Price #{i.price}"
      puts "Wheels: #{i.wheels}"
      puts '-------------------------------------'
    end
  when 2
    extra.all_extra.each do |i|
      puts '-------------------------------------'
      puts "ID:#{i.id_extra}"
      puts "Name: #{i.name}"
      puts "Price #{i.price}"
      puts '-------------------------------------'
    end
  when 3
    puts '1- Add Car'
    puts '2- Add Truck'
    option_vehicle = gets.chomp.to_i
    if option_vehicle == 1
      puts 'Enter color of the car:'
      color = gets.chomp
      puts 'Enter brand of the car:'
      brand = gets.chomp
      puts 'Enter price of the car'
      price = gets.chomp
      vehicles.add_car(color, brand, price)
    elsif option_vehicle == 2
      puts 'Enter color of the car:'
      color = gets.chomp
      puts 'Enter brand of the car:'
      brand = gets.chomp
      puts 'Enter price of the car'
      price = gets.chomp
      puts 'Enter number of wheels of the truck'
      wheels = gets.chomp
      vehicles.add_truck(color, brand, price, wheels)

    end

  when 4
    loop do
      puts 'Enter the id of the vehicle to be deleted'
      id_vehicle = gets.chomp
      vehicle = vehicles.select_vehicle id_vehicle
      if vehicle != []
        vehicles.delete_vehicle id_vehicle
        break
      end
    end

  when 5
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
  when 6
    break
  else
    option = nil
  end
end
