require "oystercard"

describe Oystercard do
  let (:entry_station) { double }
  let (:exit_station) { double }

  describe "#balance" do
    it "begins with a default balance of 0" do
      expect(subject.balance).to eq(0)
    end
  end

  describe "#topup" do
    it "topup changes the balance" do
      expect{subject.topup(20)}.to change{subject.balance}.by(20)
    end

    it "will not topup when the balance would be over £#{described_class::MAX_MONEY}" do
      expect{subject.topup(described_class::MAX_MONEY + 1)}.to raise_error "Your balance cannot go over £#{described_class::MAX_MONEY}."
    end
  end

  describe "#touch_in" do
    before(:each) do
      subject.topup(50)
    end

    it "responds to touch_in method" do
      expect(subject).to respond_to(:touch_in)
    end
  end

  describe "#touch_in_errors" do
    it "raises an error when minimum amount not reached" do
      expect{subject.touch_in(entry_station)}.to raise_error "min. balance of £#{described_class::MIN_MONEY} not reached"
    end
  end

  describe "#touch_out" do
    before(:each) do
      subject.topup(50)
    end

    it "deducts minimum fare on touch_out" do
      subject.touch_in(entry_station)
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by (-described_class::MINIMUM_FARE)
    end
  end

  describe "#penalty_charge" do
    it "there is a penalty charge" do
      expect(described_class::PENALTY_CHARGE).to eq(6)
    end

    it "penalty charge has been applied, hardcoded to true" do
      expect(subject.penalty_charge).to eq(true)
     end

    it "penalty charge deducted from balance" do
      expect{subject.penalty_charge}.to change{subject.balance}.by (-described_class::PENALTY_CHARGE)
    end
  end
end
