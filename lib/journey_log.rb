require_relative 'journey'

class JourneyLog

  attr_reader :list, :current_journey

  def initialize
    @list = []
  end

  def start(station, journey = Journey.new(station))
    @current_journey = journey
  end

  def end(station, journey = Journey.new(false))
    @current_journey = journey if no_start?
    @current_journey.end(station)
    log(@current_journey)
  end

  def log(journey)
    @list << journey
  end

  private

  def no_start?
    @current_journey.nil?
  end

end
