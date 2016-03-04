require_relative 'docking_station'

class Van
attr_reader :bikes
  def initialize
    @bikes = []
  end

   def collect_broken(station)
    #  bikes << station.broken_bikes
    station.broken_bikes.each {|bike| bikes << bike}
    station.remove_broken
  #   broken_bikes(station.bikes).each{|x| @bikes << x}
  #   station.bikes.select!{|x| x.working?}
   end
  #
  # def deliver_broken(garage)
  #   @bikes.each{|x| garage.bikes << x}
  #   @bikes = []
  # end
  #
  # def collect_working(garage)
  #   garage.bikes.each{|bike| @bikes << bike} #maybe we should have a .report_broken called on each bike to 'fix' them?
  #   garage.bikes.clear
  # end
  #
  # def deliver_working(station)
  #   @bikes.each do |bike|
  #     #until station.capacity == station.bikes.size (this loop is putting duplicates into station)
  #       station.bikes << bike if bike.working? #putting the same bikes in?????
  #     #end
  #   end
  #   @bikes = [] #need to change this because it deletes any remaining bikes once DockingStation is at capacity
  # end
  #
  # private
  # def broken_bikes(array)
  #   array.select{|bike| !bike.working?}
  # end

end
