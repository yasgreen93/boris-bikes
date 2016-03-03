require 'van'

describe Van do
  let(:bike_working){double :bike_w, :working? => true}
  let(:bike_broken){double :bike_b, :working? => false}
  it {is_expected.to respond_to(:collect_broken).with(1).argument}

  it "has an empty array to store bikes" do
    expect(subject.bikes).to be_a Array
  end

  it "can transfer broken bikes from docking station to its storage" do
    station = double(:station, :bikes => [bike_working,bike_broken])
    subject.collect_broken(station)
    expect(subject.bikes).to eq [bike_broken]
  end

  it "when bikes are transferred to van, they are removed from the station"do
    station = double(:station, :bikes => [bike_working,bike_broken])
    subject.collect_broken(station)
    expect(station.bikes).to eq [bike_working]
  end

end
