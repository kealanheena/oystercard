class Journey

  attr_reader :trip

  def initialize(entry_station)
    @trip = {
      entry: entry_station,
      exit: false
    }
  end

  def end(exit_station)
    @trip[:exit] = exit_station
  end

end