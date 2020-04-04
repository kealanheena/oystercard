require "journey"

describe Journey do

  let(:station1) { double :station }
  let(:station2) { double :station }

  describe '#initialize' do

    it 'should take an argument of entry station and add the station to the trip hash' do
      journey = Journey.new(station1)
      expect(journey.trip).to eq({ entry: station1, exit: false })
    end
  end

  describe '#end' do

    it 'should take an argument an add it to the trip instance variable' do
      journey = Journey.new(station1)
      journey.end(station2)
      expect(journey.trip).to eq({ entry: station1, exit: station2 })
    end

    it 'should return the exit station' do
      journey = Journey.new(station1)
      expect(journey.end(station2)).to eq station2
    end
  end

  describe '#paid?' do
    
    it 'should return false if the journey hasn\'t ended' do
      journey = Journey.new(station1)
      expect(journey.paid?).to eq false
    end

    it 'should return true if the journey has ended' do
      journey = Journey.new(station1)
      journey.end(station2)
      expect(journey.paid?).to be_truthy
    end
  end
end
