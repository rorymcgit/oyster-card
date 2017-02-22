require_relative "journey"

class Oystercard

  attr_reader :balance, :current_journey

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
    check_if_topup_exceeds_maximum(value)
    @balance += value
  end

  def touch_in(station)
    check_if_balance_meets_minimum
    touch_in_charge
    @in = true
    @current_journey.store_entry(station)
  end

  def touch_out(station)
    touch_out_charge
    @in = false
    @current_journey.store_exit(station)
    @current_journey = Journey.new
  end

  private
  def check_if_balance_meets_minimum
    raise "min. balance of £#{MIN_MONEY} not reached" if balance < MIN_MONEY
  end

  def check_if_topup_exceeds_maximum(value)
    raise "Topup would put value over the maximum: £#{MAX_MONEY}." if balance + value > MAX_MONEY
  end

  def touch_in_charge
    penalty_charge if @in
  end

  def touch_out_charge
    @in ? minimum_fare : penalty_charge
  end

  def penalty_charge
    @balance -= PENALTY_CHARGE
  end

  def minimum_fare
    @balance -= MINIMUM_FARE
  end

end
