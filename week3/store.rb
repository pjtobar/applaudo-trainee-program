require_relative 'car'
require_relative 'truck'


class Store

  @@colors = %i[Black Red White Blue Green]
  @@brands = %i[Toyota Nissan Datsun Ford Suzuki]
  @@prices = [12_000, 6000, 10_000, 8000, 20_000]
  @@wheels = [6, 8, 10]

  def all_vehicls
    @@all_vehicls ||=[]
  end

  def create_vehicles
    5.times do |i|
      car = Car.new(@@colors.shuffle.first, @@brands.shuffle.first, @@prices.shuffle.first, 4)
      truck = Truck.new(@@colors.shuffle.first, @@brands.shuffle.first, @@prices.shuffle.first, @@wheels.shuffle.first)
      all_vehicls << car
      all_vehicls << truck
    end
  end

end
