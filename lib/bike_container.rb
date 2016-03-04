module BikeContainer
  DEFAULT_CAPACITY = 20

  attr_reader :capacity
  attr_accessor :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def add_bike(bike)
  end
end
