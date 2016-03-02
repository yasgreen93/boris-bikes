 require "Bike"

describe Bike do
  it "responds to working? method" do
    expect(subject).to respond_to :working?
  end

  it "can be set to 'broken'" do
    expect(subject.report_broken).to eq false
  end
end
