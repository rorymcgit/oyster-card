require 'station'

describe Station, :stn do

  context "#station initialize" do
    subject { described_class.new(name: "Euston", zone: 1) }

    it "stores the name of the station on initialize" do
      expect(subject.name).to eq("Euston")
    end

    it "stores the zone on initialize" do
      expect(subject.zone).to eq(1)
    end
  end

end
