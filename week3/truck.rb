require_relative 'vehicle'
class Truck < Vehicle
  attr_accessor :wheels

  def type
    @type ||= 'Truck'
  end

  def wheels
    @wheels ||= [6, 8, 10, 12].sample
  end

  def self.create_trucks
    5.times do |_i|
      car = new(Vehicle.colors.sample, Vehicle.brands.sample, Vehicle.prices.sample * 3)
      Vehicle.all << car
    end
  end
end 
