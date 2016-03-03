require_relative 'garage'
require_relative 'docking_station'
require_relative 'van'

station = DockingStation.new
bike = Bike.new
bike.report_broken
station.dock(bike)
garage = Garage.new
van = Van.new
van.collect_broken(station)
van.deliver_broken(garage)
p garage.bikes
garage.fix_bikes
p garage.bikes
