require 'van'

describe Van do

	let(:broken_bikes) { double :broken_bikes }
	let(:bikes)   	   { double :bikes        }
	let(:station) 	   { double :station      }
	let(:garage)  	   { double :garage       }
	let(:van)     	   { Van.new              }

	it "the van should be able to pickup bikes" do
		allow(station).to receive(:instance_of?).and_return(true)
		allow(station).to receive(:broken_bikes).and_return(bikes)
		van.pickup(station)
		expect(van.bikes).to include(bikes)
	end

	it "the van should be able to drop-off bikes" do
		van.dock(bikes)
		expect(van.bikes[0]).to eq(bikes)
		allow(station).to receive(:dock)
		van.drop_off(station)
		expect(van.bike_count).to eq(0)
	end

    it "the van should only pickup fixed (available) bikes from the garage" do
    	allow(garage).to receive(:available_bikes).and_return(bikes)
    	van.pickup(garage)
    	expect(van.bikes).to include bikes
    end


end