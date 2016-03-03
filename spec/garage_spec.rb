require 'garage'

describe Garage do
  it "has an array to store bikes" do
    expect(subject.bikes).to be_a(Array)
  end

end
