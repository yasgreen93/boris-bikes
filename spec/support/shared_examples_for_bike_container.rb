shared_examples_for BikeContainer do
  let(:bike1) {double(:bike)}
  let(:bike2) {double(:bike)}
  let(:source) {double(:BikeContainer, :bikes => [bike1, bike2], :remove_bikes => [])}

  describe 'capacity' do
    it 'has a default capacity when initialized' do
      expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
    end

    it 'can be overridden on initialize' do
      random_capacity = Random.rand(100)
      subject = described_class.new random_capacity
      expect(subject.capacity).to eq random_capacity
    end
  end

    it 'displays loaded bikes' do
      subject.bikes << bike1
      subject.bikes << bike2
      expect(subject.bikes).to eq [bike1, bike2]
    end

    describe 'load_bikes' do
      it 'responds to load_bikes' do
        expect(subject).to respond_to(:load_bikes).with(1).argument
      end

      it 'loads bikes from a source' do
        subject.load_bikes(source)
        expect(subject.bikes).to eq [bike1, bike2]
      end

      it 'removes bikes from source' do # What is the point of this test? Is this not exactly the same as the test below?
        subject.load_bikes(source)
        expect(source).to respond_to(:remove_bikes).with(1).argument
        # expect(source.remove_bikes).to eq [] << is this not a better test?
      end
    end

    describe 'remove_bikes' do
      it 'responds to remove_bikes' do
        subject.load_bikes(source)
        expect(subject).to respond_to(:remove_bikes).with(1).argument
      end

      it 'removes all bikes' do # Are we removing bikes from the source here or from the @bikes array in bike container?
        # Loading bikes into @bikes array from source, then removing those bikes from @bikes array to give an empty array again?
        subject.load_bikes(source)
        expect(subject.remove_bikes(subject.bikes)).to eq []
      end

      it 'removes selected bikes only' do
        subject.load_bikes(source)
        expect(subject.remove_bikes([bike1])).to eq [bike2]
      end
    end
end

# Why have they required 'bike' at the top of their file? It seems as though it is not needed because all doubles are being used.
