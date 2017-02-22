require_relative "journey"

class Oystercard

  attr_reader :balance

  MAX_MONEY = 90
  MIN_MONEY = 1
  MINIMUM_FARE = 3
  PENALTY_CHARGE = 6

  def initialize
    @current_journey = Journey.new
    @in = false
    @balance = 0
  end

  def topup(value)
    fail "Topup would put value over the maximum: £#{MAX_MONEY}." if balance + value > MAX_MONEY
    @balance += value
  end

  def touch_in(station)
    fail "min. balance of £#{MIN_MONEY} not reached" if balance < MIN_MONEY
    penalty_charge if @in
    @in = true
    @current_journey.store_entry(station)
  end

  def touch_out(station)
    @in ? minimum_fare : penalty_charge
    @in = false
    @current_journey.store_exit(station)
    @current_journey = nil
  end

  private
  def penalty_charge
    @balance -= PENALTY_CHARGE
  end

  def minimum_fare
    @balance -= MINIMUM_FARE
  end

end
