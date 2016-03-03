require_relative 'docking_station'

class Van
  attr_accessor :storage

  def initialize
    @storage = []
  end

  def collect_broken(station)
    broken_bikes = station.bikes.select {|bike| bike.working? == false}
    broken_bikes.each {|bike| @storage << bike }
    @storage.each {|bike| station.bikes.delete(bike)}
  end

end
#
# v=Van.new
# s=DockingStation.new
# 6.times {s.dock(Bike.new)}
# s.bikes[0].report_broken
# s.bikes[3].report_broken
# s.bikes[5].report_broken
# s.bikes
