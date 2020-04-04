require_relative 'journey'

class JourneyLog

  attr_reader :list

  def initialize
    @list = []
  end

  def log(journey)
    @list << journey
  end

  def start(station, journey = Journey.new(station))
    @current_journey = journey
  end

  def end(station)
    @current_journey.end(station)
    @list << @current_journey
  end
end