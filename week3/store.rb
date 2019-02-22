require_relative 'car'
require_relative 'truck'

class Store
  attr_accessor :all_extras, :all_vehicles

  def initialize (all_vehicles, all_extras)
    @all_vehicles = all_vehicles
    @all_extras = all_extras
  end

  def delete_vehicle id_vehicle
    all_vehicles.delete_if { |i| i.id.to_s == id_vehicle.to_s}
  end

  def add_car(color, brand, price)
    car = Car.new(color,brand,price)
    loop do
      car_exist = all_vehicles.select {|i|car.id.to_s == i.id.to_s}
      if (car_exist == [])
        all_vehicles << car
        break
      else
        car = Car.new(color,brand,price)
      end
    end
  end

  def add_truck(color, brand, price, wheels)
    truck = Truck.new(color,brand,price)
    truck.wheels = wheels
    loop do
      truck_exist = all_vehicles.select {|i|truck.id.to_s == i.id.to_s}
      if (truck_exist == [])
        all_vehicles << truck
        break
      else
        truck = Truck.new(color,brand,price)
      end
    end
  end

  def select_vehicle id_vehicle
    all_vehicles.select {|i|id_vehicle.to_s == i.id.to_s}
  end

  def list_all_vehicles
    puts
    puts 'Vehicles availables'
    all_vehicles{|i| i.type}.each do |i|
      puts '-------------------------------------'
      puts "ID: #{i.id}"
      puts "Type: #{i.class.to_s}"
      puts "Color: #{i.color}"
      puts "Brand: #{i.brand}"
      puts "Price #{i.price}"
      puts "Wheels: #{i.wheels}"
      puts '-------------------------------------'
    end
  end

  def list_all_extras
    puts
    puts 'Extras availables'
    all_extras.each do |i|
      puts '-------------------------------------'
      puts "ID:#{i.id_extra}"
      puts "Name: #{i.name}"
      puts "Price #{i.price}"
      puts '-------------------------------------'
    end
  end

  def quote (extras_arr, vehicle)
    total_extra = 0
    extras_arr.each do |i|
      extra_select = all_extras.select {|j|j.id_extra.to_s == i.to_s}
      total_extra += extra_select[0].price
    end

    total =  total_extra + vehicle[0].price


    puts
    puts '------------------------------------------------------'
    puts "Quote for the car: #{vehicle[0].id}"
    puts
    puts "FEATURES"
    puts
    puts "Type: #{vehicle[0].type}"
    puts "Color: #{vehicle[0].color}"
    puts "Brand: #{vehicle[0].brand}"
    puts "Wheels: #{vehicle[0].wheels}"
    puts "Price: $#{vehicle[0].price}"
    puts '------------------------------------------------------'
    puts 'EXTRAS'
    puts
    extras_arr.each do |i|
      extra_select = all_extras.select {|j|j.id_extra.to_s == i.to_s}
      puts "#{extra_select[0].name} - $#{extra_select[0].price}"
    end

    puts '------------------------------------------------------'
    puts 'Subtotal:'
    puts "        Vehicle: $#{vehicle[0].price}"
    puts "          Extra: $#{total_extra}"
    puts
    puts "Total:           $#{total}"

    # puts "Total: #{total}"
  end
end
