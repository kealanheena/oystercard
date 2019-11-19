class Oystercard

  attr_reader :balance, :entry_station

  DEFAULT_BALANCE = 0
  MIN_PRICE = 1
  BALANCE_LIMIT = 90

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station = nil
  end

  def top_up(money)
    raise "Limit of £#{BALANCE_LIMIT} has been exceeded" if @balance >= BALANCE_LIMIT
    @balance += money
  end

  def in_journey?
    @entry_station
  end

  def touch_in(station)
    fail "Cannot touch in because your balance is less than 1" if @balance < MIN_PRICE
    @entry_station = station
  end

  def touch_out
    deduct(MIN_PRICE)
    @entry_station = nil
  end

  private

  def deduct(money)
    @balance -= money
  end

end
