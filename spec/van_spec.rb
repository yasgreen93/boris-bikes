require 'van'

describe 'Van' do
  let(:van) {Van.new}
  let(:station) {DockingStation.new}
  let(:bike) {Bike.new}

before(:each) do
    6.times {station.dock(Bike.new)}
    station.bikes[0].report_broken
    station.bikes[3].report_broken
    van.collect_broken(station)
end

  it 'collects broken bikes only' do
    expect(van.storage.size).to eq 2
  end

  it 'removes broken bikes from the docking station' do 
    expect(station.bikes.size).to eq 4
  end
end
