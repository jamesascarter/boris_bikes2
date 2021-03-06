require 'docking_station'
require 'bike'

describe DockingStation   do

	let(:bike) { Bike.new }
	let(:station) { DockingStation.new }

	it "should accept a bike" do
		  bike
		  station
		  expect(station.bike_count).to eq(0)
		  station.dock(bike)
		  expect(station.bike_count).to eq 1
	end

    it "should release a bike" do
    	bike
    	station.dock(bike)
    	station.release(bike)
    	expect(station.bike_count).to eq(0)
  end

    it "should know when its full" do
      expect(station).not_to be_full
      station.fill_station station
      expect(station).to be_full
  end

    it "should not except a bike when full" do
      station.fill_station station
      expect( lambda {station.dock(bike)} ).to raise_error(RuntimeError)
  end

    it "should provide the list of available bikes" do
    	working_bike, broken_bike = Bike.new, Bike.new
    	broken_bike.break!
    	station.dock(working_bike)
    	station.dock(broken_bike)
    	expect(station.available_bikes).to eq([working_bike])
  end
    it "should throw an error when we try to dock with no bike"
      expect(station.dock()).to raise_error(ArgumentError)

end