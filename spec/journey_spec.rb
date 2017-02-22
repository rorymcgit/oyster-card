require 'journey'

describe Journey, :helpmeplease do

let(:card){double}
let(:entry_station) {double}
let(:exit_station) {double}

  before do
    allow(card).to receive(:balance) {50}
    allow(card).to receive(:touch_in) {entry_station}
  end

  it "stores the entry station" do
    subject.store_entry(entry_station)
    expect(subject.journey[:in]).to eq entry_station
  end

  it "stores the exit station" do
   subject.store_entry(entry_station)
   subject.store_exit(exit_station)
   expect(subject.journey[:out]).to eq exit_station
  end

  it "has an empty journey list by default" do
    expect(subject.all_journeys).to be_empty
  end


  context "#stores stations after touch_out" do

  before do
     allow(card).to receive(:touch_in) {entry_station}
     allow(card).to receive(:touch_out) {exit_station}
     subject.store_entry(entry_station)
     subject.store_exit(exit_station)
    end

  it "it tests two stations stored in the hash" do
    p subject.journey
    expect(subject.journey.length).to eq(2)
  end

    it "registers a journey after touch_in and touch_out" do
      expect(subject.all_journeys[0]).to eq(subject.journey)
    end

    it "has just one journey after touch in and out" do
      expect(subject.all_journeys.length).to eq(1)
    end

  end


end
