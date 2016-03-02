# lib/dockingstation.rb
require_relative 'Bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "Sorry no bikes!" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "Too many bikes!" if full?
    @bikes << bike
    @bikes.last
  end

private

  def full?
    @bikes.length >= 20
  end

  def empty?
    @bikes.empty?
  end
end
