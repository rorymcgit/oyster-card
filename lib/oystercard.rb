
class Oystercard
  attr_reader :balance, :on_journey, :entry_station, :exit_station, :journey, :all_journeys

  MAX_MONEY = 90
  MIN_MONEY = 1
  MINIMUM_FARE = 1

  def initialize
    @current_journey = Journey.new
    @balance = 0
    @all_journeys= []
  end

  def topup(value)
    fail "Your balance cannot go over £#{Oystercard::MAX_MONEY}." if @balance + value > MAX_MONEY
    @balance += value
  end

  def touch_in(station)
    fail "min. balance of £#{Oystercard::MIN_MONEY} not reached" if @balance <= MIN_MONEY
    @current_journey.store_entry(station)
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @current_journey.store_exit(station)
    @current_journey = Journey.new
  end

  def on_journey?
    @current_journey.on_journey?
  end

  private
  def deduct(fare)
    @balance -= fare
  end

end
