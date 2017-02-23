require 'oystercard'

describe Oystercard, :o do
  subject(:card) { described_class.new }
  let(:entry_station) { double }
  let(:exit_station) { double }
  let(:journey) { double }
  let(:topup_amount) { 20 }

  describe "#balance" do
    it "begins with a default balance of 0" do
      expect(card.balance).to eq(0)
    end
  end

  describe "#topup" do
    it "topup changes the balance" do
      expect{card.topup(topup_amount)}.to change{card.balance}.by(topup_amount)
    end

    it "will not topup when the balance would be over £#{described_class::MAX_MONEY}" do
      message = "Topup would put value over the maximum: £#{described_class::MAX_MONEY}."
      expect{card.topup(described_class::MAX_MONEY + 1)}.to raise_error(message)
    end
  end

  describe "#touch_in" do
    before(:each) do
      card.topup(topup_amount)
    end

    it "responds to touch_in method" do
      expect(card).to respond_to(:touch_in)
    end
  end

  describe "#touch_in_errors" do
    it "raises an error when minimum amount not reached" do
      message = "min. balance of £#{described_class::MIN_MONEY} not reached"
      expect{card.touch_in(entry_station)}.to raise_error(message)
    end
  end

  describe "#touch_out" do
    before(:each) do
      card.topup(topup_amount)
      stub_const("MINIMUM_FARE", 3)
    end

    it "deducts minimum fare on touch_out" do
      card.touch_in(entry_station)
      expect{card.touch_out(exit_station)}.to change{card.balance}.by(-MINIMUM_FARE)
    end
  end

  describe "#penalty_charge", :p do
    context "charges penalty fare on following conditions:" do
      before(:each) do
        card.topup(topup_amount)
        stub_const("PENALTY_CHARGE", 6)
      end
      it "touch out but no touch in" do
        # NOT TOUCHING IN
        expect{card.touch_out(exit_station)}.to change{card.balance}.by(-PENALTY_CHARGE)
      end

      it "touch in without having previously touched out (touching in twice in a row)" do
        # TOUCHING IN TWICE WITHOUT A TOUCH OUT BETWEEN THEM
        card.touch_in(entry_station)
        expect{card.touch_in(entry_station)}.to change{card.balance}.by(-PENALTY_CHARGE)
      end
    end
  end
end
