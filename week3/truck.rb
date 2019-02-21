class Truck < Vehicle
  def type
    @type ||= 'Truck'
  end

  def wheels
    @wheels ||= [6, 8, 10, 12].sample
  end


end
