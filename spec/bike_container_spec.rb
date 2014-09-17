require 'bike_container'

class ContainerMockClass; include BikeContainer; end

describe BikeContainer do

  let(:holder) {ContainerMockClass.new}

  it "should accept a bike" do
  	bike = double :bike

    expect(holder.bike_count).to eq(0)
    holder.dock(bike)
    expect(holder.bike_count).to eq(1)
  end

  it "we can set the holders capacity" do
  	holder.capacity=(123)
    expect(holder.capacity).to eq(123)
  end

  it "we can find out the holders capacity" do
  	expect(holder.capacity).to eq(10)
  end

  
end