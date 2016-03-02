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
		if @bikes.all? {|bike| bike.working? == false} then raise('No bikes working')
		else @bikes.pop
		end
  end

  def dock(bike)
		fail 'Docking station full' if full?
			@bikes << bike
  end

	private

	def full?
		@bikes.size >= @capacity
	end

	def empty?
		@bikes.empty?
	end

end
