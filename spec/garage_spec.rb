require './lib/garage.rb'

describe Garage do
  let(:van) {Van.new}
  let(:station) {DockingStation.new}
  let(:bike) {Bike.new} 
  let(:garage) {Garage.new}

  	before(:each) do
  		6.times {station.dock(Bike.new)}
		station.bikes[0].report_broken
		station.bikes[3].report_broken
		station.bikes[4].report_broken
		van.collect_broken(station)
		garage.unload(van)
	end

	it 'unloads all the bikes from the van into garage' do
		# 6.times {station.dock(Bike.new)}
		# station.bikes[0].report_broken
		# station.bikes[3].report_broken
		# station.bikes[4].report_broken
		# van.collect_broken(station)
		# garage.unload(van)
		expect(garage.home.size).to eq 3
	end

	it 'empties the van' do
		expect(van.storage.size).to eq 0
	end	
end