require_relative 'journey'

class JourneyLog

  attr_reader :list, :current_journey

  def initialize
    @list = []
  end

  def start(station, journey = Journey.new(station))
    # @penalty = true if no_end?
    @current_journey = journey
  end

  def end(station, journey = Journey.new(false))
    @current_journey = journey if no_start?
    @current_journey.end(station)
    log(@current_journey)
  end

  def log(journey)
    @list << journey
    @current_journey = nil
    @list
  end

  private

  def no_start?
    @current_journey.nil?
  end

  def no_end?
    @current_journey[:exit]
  end

end
