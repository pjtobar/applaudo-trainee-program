require_relative 'vehicle'
require_relative 'car'
require_relative 'truck'


class Store

  @@colors = %i[Black Red White Blue Green]
  @@brands = %i[Toyota Nissan Datsun Ford Suzuki]
  @@prices = [12000, 6000, 10000, 8000]
  @@wheels = [6, 8, 10]

  def vehicls
    @@vehicls ||=[]
  end

  def create_car
    5.times do |i|
      car = Car.new(@@colors.shuffle.first, @@brands.shuffle.first, @@prices.shuffle.first, 4)
      vehicls << car
    end
  end

  def create_truck
    5.times do |i|
      truck = Truck.new(@@colors.shuffle.first, @@brands.shuffle.first, @@prices.shuffle.first, @@wheels.shuffle.first)
      vehicls << truck
    end
  end

end
