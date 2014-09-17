class Person

	def initialize(bike=nil)
		@bike = bike
	end

	def has_bike?
		@bike
	end

	def rent_a_bike_from(station)
		@bike = station.release_bike
	end

	def crash
		@bike.break!
	end
end