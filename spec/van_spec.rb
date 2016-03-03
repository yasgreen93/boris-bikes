require 'van'

describe 'Van' do
  let(:van) {Van.new}
  let(:station) {DockingStation.new}
  let(:bike) {Bike.new}

describe 'broken bikes' do

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

  it 'will not dock broken bikes at the station' do 
    expect{van.unload_fixed(station)}.to raise_error "These bikes are broken and so cannot be re-docked."
  end

end

  it 'docks the fixed bikes' do
    s = DockingStation.new
    6.times {s.dock(Bike.new)}
    s.bikes.each {|bike| van.storage << bike}
    expect(van.unload_fixed(s).length).to eq 0

  end
end
