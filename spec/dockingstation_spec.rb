# spec/dockingstation_spec.rb
require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it 'release bike returns instance of Bike class' do
    expect(subject.release_bike.class).to eq Bike
  end
end
