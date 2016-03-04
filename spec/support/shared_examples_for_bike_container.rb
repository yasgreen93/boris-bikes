shared_examples_for BikeContainer do
  let(:bike1) {double(:bike)}
  let(:bike2) {double(:bike)}

  it 'has a default capacity when initialized' do
    expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
  end

  describe 'capacity' do
    it 'can be overridden on initialize' do
      random_capacity = Random.rand(100)
      subject = described_class.new random_capacity
      expect(subject.capacity).to eq random_capacity
    end
  end

  describe 'take in bikes from a source' do
    # it 'receives a bike' do
    #   subject.add_bike(bike)
    #   expect(subject).not_to be_empty
    # end

    it 'displays loaded bikes' do
      subject.bikes << bike1
      subject.bikes << bike2
      expect(subject.bikes).to eq [bike1, bike2]
    end
  end
end
