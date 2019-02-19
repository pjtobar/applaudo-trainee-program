class Vehicle
  attr_accessor :color,
                :brand,
                :price,
                :wheels

  def initialize(color, brand, price, wheels)
    @color = color
    @brand = brand
    @price = price
    @wheels = wheels
  end

  class << self
    def all
      @@all ||=[]
    end

    def print_car
      @color
    end

  end
end
