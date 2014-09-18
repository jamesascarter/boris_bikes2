require 'garage'

describe Garage do

  let(:van)           { double :van }
  let(:broken_bikes)  { double :broken_bikes }
  let(:garage)        { Garage.new }
  let(:bike)		  { double :bike }

  it "should fix all the broken_bikes" do
    allow(broken_bikes).to receive(:each).and_return(true)
    allow(bike).to receive(:fix!).and_return(true)
    expect(garage.repair(broken_bikes)).to eq(true)
  end

  it "should give the van fixed bikes" do
  	garage.drop_off(van)
    expect(garage.bikes).to match_array([])  
  end

end