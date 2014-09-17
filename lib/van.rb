require 'bike_container'

class Van

	include BikeContainer

	def pickup(station)
      bikes << station.available_bikes
	end
  
end