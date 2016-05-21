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

  def broken_bikes
    @bikes.select{|bike| !bike.working?}
  end

  def remove_broken
    @bikes -= broken_bikes
  end

private

  def full?
    @bikes.length >= @capacity
  end

  def empty?
    working_bikes.empty?
  end

  def working_bikes
    @bikes.select{|bike| bike.working?}
  end
end
