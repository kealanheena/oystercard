require_relative 'journey'

class JourneyLog

  attr_reader :list

  def initialize
    @list = []
  end

  def start(station, journey = Journey.new(station))
    @current_journey = journey
  end

  def end(station, journey = Journey.new(false))
    @current_journey = journey if penalty?
    @current_journey.end(station)
    log(@current_journey)
  end

  def log(journey)
    @list << journey
    @current_journey = nil
    @list
  end

  private

  def penalty?
    @current_journey.nil?
  end

end