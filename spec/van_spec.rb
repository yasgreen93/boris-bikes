require 'van'

describe Van do
  let(:bike_working){double :bike_w, :working? => true}
  let(:bike_broken){double :bike_b, :working? => false}
  let(:station){double :station, :bikes => [bike_working, bike_broken]}
  let(:station_empty){double :station, :bikes => [], :capacity => 2}
  let(:station_full){double :station, :bikes => [bike_working], :capacity => 2}
  let(:garage){double(:garage, :bikes => [])}
  let(:garage_full){double(:garage_full, :bikes => [bike_working, bike_working])}
  it {is_expected.to respond_to(:collect_broken).with(1).argument}
  it {is_expected.to respond_to(:deliver_broken).with(1).argument}

  it "has an empty array to store bikes" do
    expect(subject.bikes).to be_a Array
  end

  describe "#collect_broken" do

    it "can transfer broken bikes from docking station to its storage" do
      subject.collect_broken(station)
      expect(subject.bikes).to eq [bike_broken]
    end

    it "when bikes are transferred to van, they are removed from the station"do
      subject.collect_broken(station)
      expect(station.bikes).to eq [bike_working]
    end

  end

  describe "#deliver_broken" do
    it "can transfer broken bikes from van to garage" do
      subject.collect_broken(station)
      subject.deliver_broken(garage)
      expect(garage.bikes).to eq([bike_broken])
    end

    it "when bikes are transferred to garage, they are removed from the van" do
      subject.collect_broken(station)
      subject.deliver_broken(garage)
      expect(subject.bikes).to be_empty
    end
  end

  describe "#collect_working" do
    it "can transfer working bikes from garage to van's storage" do
      subject.collect_working(garage_full)
      expect(subject.bikes).to eq([bike_working, bike_working])
    end
    it "when working bikes are transferred to van, they are removed from garage" do
      subject.collect_working(garage_full)
      expect(garage_full.bikes).to be_empty
    end
  end

  describe "#deliver_working" do
    it "can transfer working bikes from van to the docking station" do
      subject.collect_working(garage_full)
      subject.deliver_working(station_empty)
      expect(station_empty.bikes).not_to be_empty
    end




  end

end
