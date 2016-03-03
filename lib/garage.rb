require_relative './van.rb'

class Garage

attr_reader :home

	def initialize
		@home = []
	end

  def unload(van)
  	van.storage.each {|bike| home << bike }
  	van.storage.clear
  end

	def fixed_bikes
		home.map! do |bike|
			bike.fix_bike
			bike
		end
	end

  def load_working
  end

end

# v=Van.new
# s=DockingStation.new
# g = Garage.new
# 6.times {s.dock(Bike.new)}
# s.bikes[0].report_broken
# s.bikes[3].report_broken
# s.bikes[5].report_broken
# v.collect_broken(s)
# g.unload(v)
# g.home
