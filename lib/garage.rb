require_relative './bike_container'

class Garage
  include BikeContainer

  def initialize(options = {})
    
  end

  def repair (broken_bikes)
  	broken_bikes.each{ |bike| bike.fix! }
  end	
  
  def drop_off(van)
  	self.bikes.each  do |bike|
  		van.dock(bike) unless bike.broken?
  		self.release(bike)
  	end
  end
end