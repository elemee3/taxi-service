class Taxi
 attr_accessor :drivername, :freeseats, :make, :model, :plate, :riderslist

 def initialize (drivername, freeseats, make, model, plate)

   @drivername = drivername
   @freeseats = freeseats
   @make = make
   @model = model
   @plate = plate
   @riderslist = []

 end

 def pickup(name)
   if @riderslist.length < @freeseats
     @riderslist << name
     return true
   else
     return false
   end
 end

end

class Taxi_Service
  attr_accessor :rider_queue, :taxi_queue, :addrider, :addtaxi

  def initialize

    @rider_queue = []
    @taxi_queue = []
  end

  def addrider(name)
    @rider_queue << name
    puts "Your rider queue is now #{@rider_queue.length}"
  end

  def addtaxi(taxi)
    @taxi_queue << taxi
    puts "You have #{@taxi_queue.length} taxis"
  end

  def assign_taxi
    while @rider_queue.length > 0
      if @taxi_queue[0].pickup(@rider_queue[0])
        @rider_queue.shift()
      else
        @taxi_queue.shift()
      end
    end
  end
end

taxi_service = Taxi_Service.new
taxi1 = Taxi.new("Leila", 1, "Mazda", "3", "1111111")
taxi2 = Taxi.new("Janice", 2,"Honda", "S2K", "USUCK18")
taxi_service.addtaxi(taxi1)
taxi_service.addtaxi(taxi2)
# puts "taxi queue... #{taxi_service.taxi_queue} "
# puts "riders list  #{taxi_service.taxi_queue[0].riderslist}"
taxi_service.addrider("EricU")
taxi_service.addrider("Sunil")
taxi_service.addrider("Dakota")
taxi_service.assign_taxi
puts "first taxi list = #{taxi1.riderslist}"
puts taxi2.riderslist
# puts "passenger list  #{taxi_service.taxi_queue[0].riderslist}"
