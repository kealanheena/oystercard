require "oystercard"

describe Oystercard do
  describe "#initilize" do

    it "has a balance of '0' by default" do
      expect(subject.balance).to eq 0
    end

    it "returns balance given when user specifies balance" do
      user_input = rand(5)
      card = Oystercard.new(user_input)
      expect(card.balance).to eq user_input
    end
  end

  describe "#top_up(money)" do
    context "when starting with default balance of 0" do
      it "increases the balance to 5 when top_up(5) is called" do
        subject.top_up(5)
        expect(subject.balance).to eq 5
      end
    end

    context "when starting with a balance at full limit" do
      it "should raise an error when topping up more money" do
        card = Oystercard.new(Oystercard::BALANCE_LIMIT)
        message = "Limit of £#{Oystercard::BALANCE_LIMIT} has been exceeded"
        expect { card.top_up(5) }.to raise_error message
      end
    end
  end

  # describe "#deduct(money)" do
  #   context "when starting with a balance at £20" do
  #     it "returns a balance of £15 when £5 is deducted" do
  #       card = Oystercard.new(20)
  #       expect(card.deduct(5)).to eq 15
  #     end
  #   end
  # end

  describe "#in_journey?" do
    let(:station) { double :station }

    it "returns false when starting with a new oystercard" do
      expect(subject.in_journey?).to be_falsy
    end

    it "returns true after touching in" do
      subject.top_up(Oystercard::MIN_PRICE)
      subject.touch_in(station)
      expect(subject.in_journey?).to be_truthy
    end

    it "returns false after touching out if already touched in" do
      subject.top_up(Oystercard::MIN_PRICE)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.in_journey?).to be_falsy
    end
  end

  describe "#touch_in" do
    let(:station) { double :station }

    it "raises an error if the balance is less than #{Oystercard::MIN_PRICE}" do
      message = "Cannot touch in because your balance is less than #{Oystercard::MIN_PRICE}"
      expect { subject.touch_in(station) }.to raise_error(message)
    end

    it "takes an argument and allows the card to remember the argument as the touched in station" do
      subject.top_up(Oystercard::MIN_PRICE)
      subject.touch_in(station)
      expect(subject.entry_station).to eq station
    end
  end

  describe "#touch_out" do
    let(:station) { double :station }

    it "should deduct #{Oystercard::MIN_PRICE} from the oystercards balance" do
    subject.top_up(Oystercard::MIN_PRICE)
    subject.touch_in(station)
    expect { subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MIN_PRICE)
    end

    it "allows the card to forget the entry station" do
      subject.top_up(Oystercard::MIN_PRICE)
      subject.touch_in(station)
      subject.touch_out
      expect(subject.entry_station).to eq nil
    end
  end

end
