# lib/dockingstation.rb
require_relative 'Bike'

class DockingStation
  DEFAULT_VALUE = 20
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
    @bikes.length >= DEFAULT_VALUE
  end

  def empty?
    @bikes.empty?
  end
end
