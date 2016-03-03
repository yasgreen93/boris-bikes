require_relative 'docking_station'

class Van
attr_reader :bikes
  def initialize
    @bikes = []
  end

  def collect_broken(station)
    broken_bikes(station.bikes).each{|x| @bikes << x}
    station.bikes.select!{|x| x.working?}
  end

  def deliver_broken(garage)
    @bikes.each{|x| garage.bikes << x}
    @bikes = []
  end

  def collect_working(garage)
    garage.bikes.each{|bike| @bikes << bike}
    garage.bikes.clear
  end

  private
  def broken_bikes(array)
    array.select{|bike| !bike.working?}
  end

end
