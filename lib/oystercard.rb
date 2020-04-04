require_relative 'station'

class OysterCard
  LIMIT = 100
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 5

  attr_reader :balance, :journey_list, :exit_station, :entry_station

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
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

    @entry_station = entry_station
  end

  def touch_out(exit_station)
    @journey_list << { entry: @entry_station, exit: exit_station }
    @entry_station = nil
  end

  def in_journey?
    !@entry_station.nil?
  end

  private

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
