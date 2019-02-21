require_relative 'car'
require_relative 'truck'

class Store

  @@brands = %i[Toyota Nissan Datsun Ford Suzuki]
  @@prices = [12_000, 6000, 10_000, 8000, 20_000]
  @@wheels = [6, 8, 10]



  def all_vehicls
    @all_vehicls ||= []
  end

  def self.colors
    @colors ||= %i[Black Red White Blue Green]
  end

  def self.brands
    @brands ||= %i[Toyota Nissan Datsun Ford Suzuki]
  end

  def self.prices
    @prices ||= [12_000, 6000, 10_000, 8000, 20_000]
  end

  def self.wheels
    @wheels ||= [6, 8, 10]
  end


  def create_vehicles
    5.times do |_i|
      car = Car.new(self.class.colors.sample, self.class.brands.sample, self.class.prices.sample, 4)
      truck = Truck.new(self.class.colors.sample, self.class.brands.sample, self.class.prices.sample, self.class.wheels.sample)
      all_vehicls << car
      all_vehicls << truck
    end
  end

  def delete_vehicle id_vehicle
    all_vehicls.delete_if { |i| i.id.to_s == id_vehicle.to_s}
  end

  def add_car(color, brand, price)
    all_vehicls << Car.new(color,brand,price,4)
  end

  def add_truck(color, brand, price, wheels)
    all_vehicls << Truck.new(color,brand,price, wheels)
  end

  def select_vehicle id_vehicle
    all_vehicls.select {|i|id_vehicle.to_s == i.id.to_s}
  end
end
