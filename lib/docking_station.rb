# lib/dockingstation.rb
require_relative 'Bike'

class DockingStation

  attr_reader :bike

  def release_bike
    bike = Bike.new
  end

  def return_bike(bike)
    @bike = bike
  end

  def docked_bike
    @bike
  end
end
