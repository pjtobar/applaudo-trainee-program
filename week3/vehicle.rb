require 'securerandom'

class Vehicle
  attr_accessor :color,
                :brand,
                :price,
                :wheels

  def initialize(color, brand, price)
    @color = color
    @brand = brand
    @price = price
  end

  def id
    @id ||= SecureRandom.random_number(10_000)
  end
end
