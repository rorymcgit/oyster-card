require "oystercard"

describe Oystercard do

  it "carries a balance" do
    expect(subject.balance).to eq 0
  end

  describe "#topup" do
    it "allows topup with a value" do
      expect(subject.topup(20)).to eq 20
    end

    it "has an effect on the balance" do
      subject.topup(15)
      expect(subject.balance).to eq 15
      subject.topup(15)
      expect(subject.balance).to eq 30
    end

    it "will not topup when the balance would be over £90" do
      expect{subject.topup(91)}.to raise_error "Your balance cannot go over £90."
    end

  end

end
