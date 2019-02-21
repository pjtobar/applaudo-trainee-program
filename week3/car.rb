class Car < Vehicle
  def type
    @type ||= 'Car'
  end

  def wheels
    @wheels ||= 4
  end
end
