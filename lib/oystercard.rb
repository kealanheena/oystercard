require_relative 'station'
require_relative 'journey'

class OysterCard
  LIMIT = 100
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 5

  attr_reader :balance, :journey_list, :exit_station, :entry_station

  def initialize(balance = 0)
    @balance = balance
    @current_journey
    @journey_list = []
  end

  def top_up(amount)
    raise top_up_amount_error(amount) if @balance + amount > LIMIT

    @balance += amount
  end

  def deduct(fare = MINIMUM_FARE)
    @balance -= fare
  end

  def touch_in(entry_station)
    raise minimum_balance_error if @balance < MINIMUM_BALANCE

    # deduct(6) unless current_journey.ex
    @current_journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    @current_journey.end(exit_station)
  end

  # def in_journey?
  #   !@entry_station.nil?
  # end

  private

  def log_journey
    @journey_list << current_journey
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

class BalanceError < StandardError
end

class JourneyError < StandardError
end
