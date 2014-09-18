require 'garage'

describe Garage do

  let(:van)           { double :van }
  let(:broken_bikes)  { double :broken_bikes }
  let(:garage)        { Garage.new}

  it "should fix all the broken_bikes" do
    allow(:broken_bikes).to receive(:fix!).and_return(true)
    garage.repair(broken_bikes)
    expect().to eq()
  end

end