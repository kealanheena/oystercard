require 'oystercard'

describe OysterCard do

  let(:card) { OysterCard.new(0, journey_log) }
  let(:limit) { OysterCard::LIMIT }
  let(:min_balance) { OysterCard::MINIMUM_BALANCE }
  let(:min_fare) { OysterCard::MINIMUM_FARE }
  let(:station) { double :station }
  let(:station2) { double :station }
  let(:journey) { double :journey }
  let(:journey2) { double :journey }
  let(:journey_log) { double :journey_log }

  before(:each) do
    allow(journey_log).to receive(:start).with(station) { journey }
    allow(journey_log).to receive(:start).with(station2) { journey2 }
    allow(journey_log).to receive(:current_journey) { nil }
    allow(journey_log).to receive(:end).with(station2) { [journey] }
  end

  describe '#initialize' do
    it 'should initialize the class with a balance of zero' do
      expect(card.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it 'should add given amount to balance' do
      card.top_up(10)
      expect(card.balance).to eq(10)
    end

    it 'should not push balance above limit' do
      limit.times { card.top_up 1 }
      amount = 1
      message = "Can't exceed #{limit} with #{amount}"
      expect { card.top_up amount }.to raise_error BalanceError, message
    end
  end

  describe '#deduct' do
    it 'should deduct a specified fare,then return the remaining balance' do
      card.top_up(30)
      expect(card.deduct(10)).to eq(20)
    end
  end

  describe '#touch_in' do
    
    it 'should charge a penalty of £6 if you touch in without touching out' do
      card.top_up(50)
      card.touch_in(station)
      allow(journey_log).to receive(:current_journey) { journey }
      allow(journey).to receive(:paid?) { false }
      card.touch_in(station2)
      expect(card.balance).to eq(44)
    end

    it 'should raise an error if user tries to travel under minimum balance' do
      message = "Insuffient funds, please top up by #{min_balance}"
      expect { card.touch_in(station) }.to raise_error JourneyError, message
    end
  end

  describe '#touch_out' do
    before do
      card.top_up(50)
      card.touch_in(station)
    end

    it 'should deduct a correct amount from my card when journey is complete' do
      card.touch_out(station2)
      expect { card.deduct }.to change { card.balance }.by(-min_fare)
    end

    it 'should accept an argument of the exit station, and store it' do
      expect(card.touch_out(station2)).to eq [journey]
    end

  end
end
