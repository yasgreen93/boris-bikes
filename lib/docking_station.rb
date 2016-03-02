# lib/dockingstation.rb
require_relative 'Bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "Sorry no bikes!" if @bikes.length == 0
    @bikes.pop
  end

  def dock(bike)
    raise "Too many bikes!" if @bikes.length >= 20
    @bikes << bike
    @bikes.last
  end

end
