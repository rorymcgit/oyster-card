
class Oystercard
  attr_reader :balance

  MAX_MONEY = 90

  def initialize
    @balance = 0
  end

  def topup(value)
    fail "Your balance cannot go over £#{Oystercard::MAX_MONEY}." if @balance + value > MAX_MONEY
    @balance += value
  end
end
