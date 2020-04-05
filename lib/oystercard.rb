require_relative 'station'
require_relative 'journey_log'
require_relative 'errors'

class OysterCard
  LIMIT = 100
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 5
  PENALTY_FARE = 6

  attr_reader :balance, :journey_log

  def initialize(balance = 0, journey_log = JourneyLog.new)
    @balance = balance
    @journey_log = journey_log
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

    # penalty unless first_journey? || @journey_log.current_journey.last.paid?
    @journey_log.start(entry_station)
  end

  def touch_out(exit_station)
    @journey_log.end(exit_station)
  end

  private

  def penalty
    deduct(PENALTY_FARE)
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
