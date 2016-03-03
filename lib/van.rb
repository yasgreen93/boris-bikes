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

  private
  def broken_bikes(array)
    array.select{|bike| !bike.working?}
  end

end
