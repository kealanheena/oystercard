require "station"

describe Station do

  describe "#name" do
    it "return the station's name" do
      station = Station.new("Liverpool Street", 1)
      expect(station.name).to eq "Liverpool Street"
    end
  end

  describe "#zone" do
    it "return the station's zone" do
      station = Station.new("Liverpool Street", 1)
      expect(station.zone).to eq 1
    end
  end

end