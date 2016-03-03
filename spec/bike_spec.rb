require 'bike'

describe Bike do

  it 'can be reported broken' do
    subject.report_broken
    expect(subject.working?).to eq false
  end

end
