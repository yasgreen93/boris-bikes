require 'van'

describe 'Van' do
  let(:van) {Van.new}
  let(:station) {DockingStation.new}
  let(:bike) {Bike.new}


  it 'can collect a bike' do
    station.dock(bike)
    station.bikes[0].report_broken
    van.collect_broken(station)
    expect(van.storage.size).to eq 1
  end

  it 'collects broken bikes only' do
    6.times {station.dock(Bike.new)}
    station.bikes[0].report_broken
    station.bikes[3].report_broken
    van.collect_broken(station)
    expect(van.storage.size).to eq 2
  end

end
