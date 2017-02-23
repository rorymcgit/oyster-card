require_relative 'journey'

class Oystercard

  attr_reader :balance, :current_journey

  MAX_MONEY = 90
  MIN_MONEY = 1

  def initialize
    @balance = 0
  end

  def topup(value)
    check_if_topup_exceeds_maximum_limit(value)
    @balance += value
  end

  def touch_in(station)
    check_if_balance_meets_minimum
    deduct(@current_journey.touch_in_charge) unless @current_journey == nil
    @current_journey = Journey.new
    @current_journey.store_entry(station, self)
  end

  def touch_out(station)
    @current_journey ||= Journey.new
    deduct(@current_journey.touch_out_charge)
    @current_journey.store_exit(station, self)
    @current_journey = nil
    self
  end

  private
  def deduct(amount)
    @balance -= amount
  end

  def check_if_balance_meets_minimum
    raise "min. balance of £#{MIN_MONEY} not reached" if balance < MIN_MONEY
  end

  def check_if_topup_exceeds_maximum_limit(value)
    raise "Topup would put value over the maximum: £#{MAX_MONEY}." if balance + value > MAX_MONEY
  end

end
