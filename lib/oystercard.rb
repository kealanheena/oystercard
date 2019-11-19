class Oystercard

  attr_reader :balance

  DEFAULT_BALANCE = 0
  MIN_PRICE = 1
  BALANCE_LIMIT = 90

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey = false
  end

  def top_up(money)
    raise "Limit of £#{BALANCE_LIMIT} has been exceeded" if @balance >= BALANCE_LIMIT
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def in_journey?
    @journey
  end

  def touch_in
    fail "Cannot touch in because your balance is less than 1" if @balance < MIN_PRICE
    @journey = true
  end

  def touch_out
    @journey = false
  end
end
