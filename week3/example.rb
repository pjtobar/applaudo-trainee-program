require_relative 'vehicle'
require_relative 'car'
require_relative 'truck'
require_relative 'store'
require_relative 'extra'

Car.create_cars
Truck.create_trucks
Extra.create_extra

store = Store.new(Vehicle.all, Extra.all)

option = nil

while option != 'Exit'

  puts '----------------------------------------------------------'
  puts 'WELCOME TO STORE'
  puts 'Main Menu'
  puts '----------------------------------------------------------'
  puts 'Select an option'
  puts '  1- Show available vehicles'
  puts '  2- Show available Extras'
  puts '  3- Add a vehicle to the store'
  puts '  4- Remove a vehicle from the store'
  puts '  5- Quote a vehicle'
  puts '  6- Exit'
  option = gets.chomp.to_i

  case option
  when 1
    store.list_all_vehicles
  when 2
    store.list_all_extras
  when 3
    puts
    puts 'Select an option:'
    puts '  1- Add Car'
    puts '  2- Add Truck'
    option_vehicle = gets.chomp.to_i
    if option_vehicle == 1
      puts 'Enter color of the car:'
      color = gets.chomp
      puts 'Enter brand of the car:'
      brand = gets.chomp
      puts 'Enter price of the car'
      price = gets.chomp
      store.add_car(color, brand, price)
    elsif option_vehicle == 2
      puts 'Enter color of the car:'
      color = gets.chomp
      puts 'Enter brand of the car:'
      brand = gets.chomp
      puts 'Enter price of the car'
      price = gets.chomp
      puts 'Enter number of the wheels'
      wheels = gets.chomp
      store.add_truck(color, brand, price, wheels)
    end
    store.list_all_vehicles

  when 4
    loop do
      puts 'Enter the id of the vehicle to be deleted'
      id_vehicle = gets.chomp
      vehicle = store.select_vehicle id_vehicle
      if vehicle != []
        store.delete_vehicle id_vehicle
        break
      end
    end

  when 5
    vehicle = []
    store.list_all_vehicles
    loop do
      puts 'Enter vehicle id to add extras'
      id_vehicle = gets.chomp
      vehicle = store.select_vehicle id_vehicle
    break if vehicle != []
    end

    store.list_all_extras
    extras_arr=[]
    add_more = 'Y'

    loop do
      if (add_more == 'Y')
        puts 'Enter id of the extras you want to add'
        id_extra = gets.chomp
        if Extra.exits(id_extra) == []
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
    store.quote(extras_arr, vehicle)
  when 6
    break
  else
    option = nil
  end
end
