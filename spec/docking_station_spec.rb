require 'docking_station'

describe DockingStation do
  let(:bike) {Bike.new}
    it { is_expected.to respond_to :release_bike }

    describe 'create docking station' do
      it 'if no arguments default capacity is 20' do
        expect(subject.capacity).to eq 20
      end

      it 'when given 10 capacity is set to 10' do
        expect(DockingStation.new(10).capacity).to eq 10
      end
    end

    describe '#release_bike' do
      it 'cannot release broken bike' do
        subject.dock(bike)
        bike.report_broken
        expect{ subject.release_bike }.to raise_error 'No bikes working'
      end

      it 'releases a bike' do
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
      	expect(subject.dock(bike)).to eq [bike]
      end

      it 'raises an error when the docking station is full' do
        subject.capacity.times {subject.dock(bike)}
        expect { subject.dock(bike) }.to raise_error 'Docking station full'
      end

      it 'returns docked bikes' do
      	expect(subject.dock(bike)).to eq [bike]
      end

    end

end
