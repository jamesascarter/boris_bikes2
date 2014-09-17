require 'bike_container'

class Van

	include BikeContainer

	def available_bikes
	  bikes.select{|bike| bike.broken?}
	end
 
	def pickup(station)
      bikes << station.available_bikes
	end
  
end