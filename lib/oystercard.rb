
class Oystercard
  attr_reader :balance, :on_journey

  MAX_MONEY = 90
  MIN_MONEY = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @on_journey = false
  end

  def topup(value)
    fail "Your balance cannot go over £#{Oystercard::MAX_MONEY}." if @balance + value > MAX_MONEY
    @balance += value
  end

  def touch_in
    fail "min. balance of £#{Oystercard::MIN_MONEY} not reached" if @balance <= MIN_MONEY
    @on_journey = true
  end

  def touch_out
    @on_journey = false
    deduct(MINIMUM_FARE)
  end

  def on_journey?
    @on_journey
  end

  private
  def deduct(fare)
    @balance -= fare
  end

end
