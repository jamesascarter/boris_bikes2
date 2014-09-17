require 'person'

describe Person do

	it "has no bike when newly created" do
		person = Person.new
		expect(person).to_not have_bike
	end
	
	it "can receive a bike from the docking station" do
		station = double :station
		bike = double :bike
		person = Person.new
		allow(station).to receive(:release_bike).and_return(bike)
		expect(person).to_not have_bike
		person.rent_a_bike_from station
		expect(person).to have_bike
	end

	it "can brake a bike" do
		bike = double :bike
		allow(bike).to receive(:break!)
		expect(bike).to receive(:break!)
		person = Person.new(bike)
		person.crash
	end



end