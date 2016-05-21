require 'garage'

describe Garage do
  let(:bike_working){double :bike_w, :working? => true}
  let(:bike_broken){double :bike_b, :working? => false}

  it "has an array to store bikes" do
    expect(subject.bikes).to be_a(Array)
  end

  describe "remove_bikes" do
    it "should remove bikes from garage" do
      subject.bikes << bike_working
      expect(subject.remove_bikes).to eq []
    end
  end

  describe "fix_bikes" do
    it "should fix the bikes in the garage" do
      bike = Bike.new
      bike.report_broken
      subject.bikes << bike
      subject.fix_bikes
      expect(bike).to be_working
    end
  end

end
