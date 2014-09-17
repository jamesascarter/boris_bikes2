require 'van'

describe Van do
	
	it "the van should be able to pickup bikes" do
		broken_bikes = double :broken_bikes
		bikes = double :bikes
		station = double :station
		allow(station).to receive(:available_bikes).and_return(broken_bikes)
		van = Van.new
		van.pickup(station)
		expect(van.bikes).to include(broken_bikes)
	end


end