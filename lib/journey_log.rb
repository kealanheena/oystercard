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
    journey
  end
end