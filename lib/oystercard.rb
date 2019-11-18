class Oystercard

  attr_reader :balance

  DEFAULT_BALANCE = 0
  BALANCE_LIMIT = 90

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(money)
    raise "Limit of £#{BALANCE_LIMIT} has been exceeded" if @balance >= BALANCE_LIMIT
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end
end
