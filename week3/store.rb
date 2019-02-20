require_relative 'car'
require_relative 'truck'

class Store
  @@colors = %i[Black Red White Blue Green]
  @@brands = %i[Toyota Nissan Datsun Ford Suzuki]
  @@prices = [12_000, 6000, 10_000, 8000, 20_000]
  @@wheels = [6, 8, 10]

  def all_vehicls
    @all_vehicls ||= []
  end

  def create_vehicles
    5.times do |_i|
      car = Car.new(@@colors.sample, @@brands.sample, @@prices.sample, 4)
      truck = Truck.new(@@colors.sample, @@brands.sample, @@prices.sample, @@wheels.sample)
      all_vehicls << car
      all_vehicls << truck
    end
  end

  def delete_vehicle id_vehicle
    all_vehicls.delete_if { |i| i.id.to_s == id_vehicle.to_s}
  end

  def add_car car
    all_vehicls << car
  end

  def select_vehicle id_vehicle
    all_vehicls.select {|i|id_vehicle.to_s == i.id.to_s}
  end
end
