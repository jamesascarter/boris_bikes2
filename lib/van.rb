require_relative './bike_container'
require_relative './docking_station'

class Van

	include BikeContainer

	def available_bikes
	  bikes.select{|bike| bike.broken?}
	end
 
	def pickup(holder)
	  if holder.instance_of?(DockingStation)
        self.bikes << holder.broken_bikes
      else
        self.bikes << holder.available_bikes 
      end
	end

	def drop_off(station)
	  self.bikes.each do |bike|
	  	station.dock(bike)
	  	self.bikes.delete(bike)
	  end
	end
  
end