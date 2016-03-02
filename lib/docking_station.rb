# lib/dockingstation.rb
require_relative 'Bike'

class DockingStation
  attr_reader :bike

  def release_bike
    raise "Sorry no bikes!" if @bike.nil?
    @bike
  end

  def dock(bike)
    @bike = bike
  end

end
