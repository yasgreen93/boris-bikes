
require "docking_station"

describe DockingStation do
  it { is_expected.to respond_to (:release_bike) }
  let(:bike){double :bike, :working? => true}

  it 'releases working bikes' do
    bike = double(:bike, :working? => true)
    subject.dock bike
    #allow(bike).to receive(:working?).and_return(true)
    expect(subject.release_bike).to be_working
  end

  it 'has a dock method which takes one argument' do
    expect(subject).to respond_to(:dock).with(1).arguments
  end

  it 'docks a bike' do
    expect(subject.dock(bike)).to eq bike
  end

  it { is_expected.to respond_to (:bikes)}

  it 'shows the docked bike' do
    subject.dock(bike)
    expect(subject.bikes.last).to eq bike
  end

  it "raises error if no bikes" do
    # be wary of {} and () - literal meaning of outputs
    expect {subject.release_bike}.to raise_error("Sorry no bikes available!")
  end

  it "won't dock bikes if full" do
    subject.capacity.times {subject.dock bike}
    expect {subject.dock bike}.to raise_error("Too many bikes!")
  end

  it "initializes with an array for bikes" do
    expect(subject.bikes).to be_a Array
  end

  it "Should have default capacity of 20" do
    expect(DockingStation::DEFAULT_VALUE).to eq 20
  end

  it "should set capacity if initialized with argument" do
    station = DockingStation.new(10)
    expect(station.capacity).to eq 10
  end

  it "should have capacity of 20 when initialized with no argument" do
    station = DockingStation.new
    expect(station.capacity).to eq DockingStation::DEFAULT_VALUE
  end

  it "should not release a broken bike" do
    bike = double(:bike, :working? => false, :report_broken => false)
    bike.report_broken
    subject.dock(bike)
    expect {subject.release_bike}.to raise_error("Sorry no bikes available!")
  end


  describe "broken bikes" do
    it "should return an array of only broken bikes" do
      bike_broken = double(:bike, :working? => false)
      subject.dock(bike)
      subject.dock(bike_broken)
      expect(subject.broken_bikes).to eq [bike_broken]
    end
  end



end
