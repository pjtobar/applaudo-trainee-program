require 'securerandom'

class Extra
  attr_accessor :name,
                :price

  def initialize(name, price)
    @name ||= name
    @price ||= price
  end

  def id_extra
    @id_extra ||= SecureRandom.random_number(10000)
  end

  def all_extra
    @all_extra ||= []
  end

  def create_extra
    name.each_with_index do |name, i|
      extra = Extra.new(name,price[i])
      all_extra << extra
    end
  end
end
