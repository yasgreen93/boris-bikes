require_relative 'bike'
class DockingStation
	DEFAULT_CAPACITY = 20

	attr_reader :bikes, :capacity

	def initialize(capacity=DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
	end

  def release_bike
    fail 'No bikes available' if empty?
		working_bikes = bikes.select {|bike| bike.working? == true}
		if working_bikes.empty? then raise('No bikes working')
		else
			good_bike	= working_bikes.pop
			bikes.delete(good_bike)
		end
  end

  def dock(bike)
		fail 'Docking station full' if full?
			bikes << bike
  end

	private

	def full?
		bikes.size == capacity
	end

	def empty?
		bikes.empty?
	end

end
