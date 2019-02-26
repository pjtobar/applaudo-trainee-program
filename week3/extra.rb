require 'securerandom'

class Extra
  attr_accessor :name,
                :price

  def initialize(name, price)
    @name ||= name
    @price ||= price
  end

  def self.names
    @names ||= ['Radio', 'AC', 'Sunroof', 'Leather Seats', 'Power Windows']
  end

  def self.prices
    @prices ||= [200, 300, 400, 500, 600]
  end

  def id_extra
    @id_extra ||= SecureRandom.random_number(10_000)
  end

  def self.all
    @all ||= []
  end

  def self.create_extra
    names.each_with_index do |name, i|
      extra = new(name, prices[i])
      all << extra
    end
  end

  def self.exits(id_extra)
    all.select { |i| id_extra.to_s == i.id_extra.to_s }
  end
end
