require 'rspec'
require_relative 'taxi'


describe Taxi do
 before do
   @a_taxi = Taxi.new("Janice", 4, "Subaru", "WRX", "7NMP103")

 end
 it "always has driver name" do
   expect(@a_taxi.drivername).to be_a String
 end

 it "has number of free seats" do
   expect(@a_taxi.freeseats).to be_a Numeric
 end

 it "has a car make" do
   expect(@a_taxi.make).to be_a String
 end

 it "has a car model" do
   expect(@a_taxi.model).to be_a String
 end

 it "has a license plate" do
   expect(@a_taxi.plate).to be_a String
   expect(@a_taxi.plate.length).to eq(7)
 end

 it "has a riders list" do
   expect(@a_taxi.riderslist).to be_a Array
 end
#HOW TO ADD STRINGS INTO AN EMPTY ARRAY!!!!!!????
#Create pickup method that adds a name to the rider list

  it "has a pickup method" do
    expect(@a_taxi).to respond_to(:pickup)
  end

 it "Add name to rider list" do
   @a_taxi.pickup("Janice")
   expect(@a_taxi.riderslist.length).to be 1
   expect(@a_taxi.riderslist[0]).to eq "Janice"
 end
end

describe Taxi_Service do
  before do
    @taxi1 = Taxi.new("Leila", 2, "Mazda", "3", "1111111")
    @taxi2 = Taxi.new("Janice", 2,"Honda", "S2K", "USUCK18")
    @taxi_service = Taxi_Service.new()
  end
 #riderqueue starts as empty arr
  it "has a rider queue that starts as empty array" do
    expect(@taxi_service.rider_queue).to be_a Array
    expect(@taxi_service.rider_queue.length).to eq(0)
  end

 #taxiqueue starts as empty arr
 it "has a taxi queue that starts as empty array" do
   expect(@taxi_service.taxi_queue).to be_a Array
   expect(@taxi_service.taxi_queue.length).to eq(0)
 end
 #add_rider method
 it "has an add rider method" do
   @taxi_service.addrider("Henry")
   expect(@taxi_service).to respond_to (:addrider)
   expect(@taxi_service.rider_queue.length). to be 1
 end
 #add_taxi method
 it "has an add taxi method" do
   @taxi_service.addtaxi(@taxi1)
   expect(@taxi_service).to respond_to (:addtaxi)
   expect(@taxi_service.taxi_queue.length). to be 1
 end
 #assign_taxi method that matches riders to taxis

it "has an assign_taxi method" do
  expect(@taxi_service).to respond_to (:assign_taxi)
end

it "has an assign_taxi method that assigns taxis." do
  @taxi_service.addtaxi(@taxi1)
  @taxi_service.addrider("Janice")
  @taxi_service.assign_taxi
  expect(@taxi_service.rider_queue.length). to be 0
  expect(@taxi_service.taxi_queue[0].riderslist.length). to be 1
  expect(@taxi_service.taxi_queue[0].riderslist[0]). to eq("Janice")
end

it "can fill subsequent taxis" do
  @taxi_service.addtaxi(@taxi1)
  @taxi_service.addtaxi(@taxi2)
  @taxi_service.addrider("EricU")
  @taxi_service.addrider("Sunil")
  @taxi_service.addrider("Dakota")
  @taxi_service.assign_taxi
  expect(@taxi_service.taxi_queue.length).to be 1
  expect(@taxi_service.rider_queue.length). to be 0
  # expect(@taxi1.riderslist.length).to be 2
end


end
