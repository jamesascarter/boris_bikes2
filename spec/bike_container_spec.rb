require 'bike_container'
require 'bike'

class ContainerMockClass; include BikeContainer; end

describe BikeContainer do

  let(:holder) {ContainerMockClass.new}
  let(:bike) {Bike.new}

  it "should accept a bike" do
  	bike = double :bike
    expect(holder.bike_count).to eq(0)
    holder.dock(bike)
    expect(holder.bike_count).to eq(1)
  end

  it "should release a bike" do
    expect(holder.bike_count).to eq(0)
    holder.dock(bike)
    expect(holder.bike_count).to eq(1)
    holder.release(bike)
    expect( holder.bike_count ).to eq(0) 
  end  

  it "we can set the holders capacity" do
  	holder.capacity=(123)
    expect(holder.capacity).to eq(123)
  end

  it "we can find out the holders capacity" do
  	expect(holder.capacity).to eq(10)
  end

  it "should release its broken bikes" do
    2.times {holder.dock(bike)}
    3.times {
      bike.break!
      holder.dock(bike)
    }
    expect(holder.bike_count).to eq(5)
    expect(holder.broken_bikes.all?{ |bike| bike.broken? == true }).to eq(true)
  end

  it "return error when we try to release a bike that is not there" do
    expect(holder.bike_count).to eq (0)
    expect(lambda {holder.release(bike)}).to raise_error(RuntimeError)
  end

  it "should release a bike when called without a bike" do
    holder.dock(bike)
    expect( holder.release() ).to eq(bike)
  end

  

  
end