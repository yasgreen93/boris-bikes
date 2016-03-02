# lib/dockingstation.rb
require_relative 'Bike'

class DockingStation
  attr_reader :bike

  def release_bike
    raise "Sorry no bikes!" unless @bike
    @bike
  end

  def dock(bike)
    raise "Too many bikes!" if @bike
    @bike = bike
  end

end
