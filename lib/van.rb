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

  def deliver_working(station)
    @bikes.each do |bike|
      until station.capacity == station.bikes.size
        station.bikes << bike if bike.working?
      end
    end
    @bikes = []
  end

  private
  def broken_bikes(array)
    array.select{|bike| !bike.working?}
  end

end
