require_relative 'bike'

class Garage
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def remove_bikes
    bikes = []
  end

  def fix_bikes
    bikes.each{|bike| bike.report_broken}
  end


end
