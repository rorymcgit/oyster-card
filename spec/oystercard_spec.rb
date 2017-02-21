require "oystercard"

describe Oystercard do

  context "#balance" do
  it "carries a balance" do
    expect(subject.balance).to eq 0
  end

  it "has an effect on the balance" do
    expect{ subject.topup(10)}.to change{ subject.balance }.by 10
  end

end

  context "#topup" do

    it "responds to topup with 1 argument" do
      expect(subject).to respond_to(:topup).with(1).argument
    end


    it "allows topup with a value" do
      expect(subject.topup(20)).to eq 20
    end


    it "will not topup when the balance would be over £#{Oystercard::MAX_MONEY}" do
      expect{subject.topup(91)}.to raise_error "Your balance cannot go over £#{Oystercard::MAX_MONEY}."
    end

  end

end
