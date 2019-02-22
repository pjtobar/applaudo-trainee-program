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

  def self.all
      @all ||=[]
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

end
