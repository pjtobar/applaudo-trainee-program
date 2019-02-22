require_relative 'vehicle'

class Car < Vehicle

  def type
    @type ||= 'Car'
  end

  def wheels
    @wheels ||= 4
  end

  def self.create_cars
    5.times do |_i|
      car = self.new(Vehicle.colors.sample, Vehicle.brands.sample, Vehicle.prices.sample)
      Vehicle.all << car
    end
  end
end
