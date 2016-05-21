require_relative 'docking_station'

class Van
attr_reader :bikes
  def initialize
    @bikes = []
  end

   def collect_broken(station)
    station.broken_bikes.each {|bike| bikes << bike}
    station.remove_broken
   end

   def deliver_broken(garage)
     bikes.each{|x| garage.bikes << x}
     remove_bikes
   end

   def remove_bikes
     bikes = []
   end

   def collect_working(garage)
     garage.bikes.each{|bike| bikes << bike}
     garage.remove_bikes
   end

   def deliver_working(station)
     bikes.each {|bike| station.bikes << bike}
     remove_bikes
   end

end
