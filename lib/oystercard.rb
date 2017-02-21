
class Oystercard
  attr_reader :balance, :touched_in, :in_journey

  MAX_MONEY = 90
  MIN_MONEY = 1

  def initialize
    @balance = 0
    @touched_in = false
    @in_journey = false
  end

  def topup(value)
    fail "Your balance cannot go over £#{Oystercard::MAX_MONEY}." if @balance + value > MAX_MONEY
    @balance += value
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    fail "min. balance of £#{Oystercard::MIN_MONEY} not reached" if @balance <= MIN_MONEY
    @touched_in = true
  end

  def touch_out
    @touched_in = false
  end

  def in_journey?
    if @touched_in == true
      @in_journey = true
    else
      @in_journey = false
    end
  end

end
