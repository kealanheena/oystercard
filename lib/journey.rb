class Journey

  attr_reader :trip

  def initialize(entry_station)
    @trip = {
      entry: entry_station,
      exit: nil
    }
  end

  def end(exit_station)
    @trip[:exit] = exit_station
  end

  private

  def paid?
    @trip[:exit]
  end

end
