require 'station'

describe Station, :stn do
  let(:station) { described_class.new("Euston", 1) }

  context "#station initialize" do
    it "stores the name of the station on initialize" do
      expect(station.name).to eq("Euston")
    end

    it "stores the zone on initialize" do
      expect(station.zone).to eq(1)
    end
  end
end
