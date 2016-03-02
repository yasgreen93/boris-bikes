# lib/dockingstation.rb
require_relative 'Bike'

class DockingStation
  DEFAULT_VALUE = 20
  attr_reader :bikes, :capacity
  def initialize(initial_capacity=DEFAULT_VALUE)
    @bikes = []
    @capacity = initial_capacity
  end

  def release_bike
    raise "Sorry no bikes available!" if empty?
    working_bikes.pop
  end

  def dock(bike)
    raise "Too many bikes!" if full?
    @bikes << bike
    @bikes.last
  end

private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    #@bikes.empty?
    working_bikes.empty?
  end

  def working_bikes
    @bikes.select{|bike| bike.working?}
  end
end
