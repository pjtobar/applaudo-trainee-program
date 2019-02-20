require 'securerandom'

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

  def id
    @id ||= SecureRandom.uuid
  end


end
