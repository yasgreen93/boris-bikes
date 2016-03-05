module BikeContainer
  DEFAULT_CAPACITY = 20

  attr_reader :capacity
  attr_accessor :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def load_bikes(source)
    source.bikes.each { |bike| bikes << bike  }
    @bikes
  end

  def remove_bikes(bike_array)
    @bikes -= bike_array
  end
end
