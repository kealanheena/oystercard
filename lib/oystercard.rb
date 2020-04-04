require_relative 'station'
require_relative 'errors'

class OysterCard
  LIMIT = 100
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 5
  PENALTY_FARE = 6

  attr_reader :balance, :journey_list

  def initialize(balance = 0)
    @balance = balance
    @journey_list = []
  end

  def top_up(amount)
    raise top_up_amount_error(amount) if @balance + amount > LIMIT

    @balance += amount
  end

  def deduct(fare = MINIMUM_FARE)
    @balance -= fare
  end

  def touch_in(entry_station, journey = Journey.new(entry_station))
    raise minimum_balance_error if @balance < MINIMUM_BALANCE

    penalty unless first_journey? || @current_journey.paid?
    @current_journey = journey
  end

  def touch_out(exit_station)
    @current_journey.end(exit_station)
    log_journey
  end

  private

  def penalty
    deduct(PENALTY_FARE)
    log_journey
  end

  def log_journey
    @journey_list << @current_journey
  end

  def first_journey?
    @current_journey.nil?
  end

  def top_up_amount_error(amount)
    message = "Can't exceed #{LIMIT} with #{amount}"
    BalanceError.new(message)
  end

  def minimum_balance_error
    message = "Insuffient funds, please top up by #{MINIMUM_BALANCE}"
    JourneyError.new(message)
  end
end
