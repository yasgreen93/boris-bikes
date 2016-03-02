require 'docking_station'

describe DockingStation do

    it { is_expected.to respond_to :release_bike }

    describe '#release_bike' do
      it 'releases a bike' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to eq bike
      end

      it 'raises an error when there are no bikes available' do
        expect { subject.release_bike }.to raise_error 'No bikes available'
      end
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bikes) }

    describe 'docking bike' do
      it 'docks something' do
      	bike = Bike.new
      	expect(subject.dock(bike)).to eq [bike]
      end


      it 'raises an error when the docking station is full' do
        DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
        bike2 = Bike.new
        expect { subject.dock(bike2) }.to raise_error 'Docking station full'
      end

      it 'returns docked bikes' do
        bike = Bike.new
      	expect(subject.dock(bike)).to eq [bike]
      end
    end

end
