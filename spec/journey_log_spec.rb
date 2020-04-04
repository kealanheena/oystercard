require 'journey_log'

describe JourneyLog do

  let(:journey) { double :journey }
  let(:journey2) { double :journey }
  let(:station) { double :station }
  let(:station2) { double :station }

  before(:each) do
    allow(journey).to receive(:end).with(station2) { station2 }
  end

  describe '#initialize' do
    it 'should initialze with an empty journey array' do
      expect(subject.list).to eq []
    end
  end

  describe '#log' do
    it 'should add the journey to the list' do
      expect(subject.log(journey)).to eq [journey]
    end

    it 'should be able to log multiple journeys' do
      subject.log(journey2)
      expect(subject.log(journey)).to eq [journey2, journey]
    end
  end

  describe '#start' do
    it 'should start a journey and add the start location to the journey' do
      expect(subject.start(station, journey)).to eq journey
    end
  end

  describe '#end' do
    it 'should add the journey to the list' do
      subject.start(station, journey)
      expect(subject.end(station2)).to eq [journey]
    end

    it 'should store the journey even if there was no start station' do
      expect(subject.end(station2, journey)).to eq [journey]
    end
  end
end
