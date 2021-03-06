module BikeContainer

  DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end
  
  def capacity=(value)  
    @capacity = value
  end  

  def bike_count
    bikes.count
  end

  def dock(bike)
  	raise "Station is full" if full?
  	bikes << bike
  end

  def release(bike = nil)
    if bike
      raise "Bike mis-match cant release as does not exist" if !bikes.include?(bike)
      bikes.delete(bike)
    else  
      bikes.shift
    end
  end

  def full?
  	bikes.count == capacity
  end

  def available_bikes
  	bikes.reject{|bike| bike.broken?}
  end

  def broken_bikes
    bikes.select{|bike| bike.broken?}
  end  

end