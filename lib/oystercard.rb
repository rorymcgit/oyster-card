
class Oystercard
  attr_reader :balance, :on_journey, :entry_station, :exit_station, :journey, :all_journeys

  MAX_MONEY = 90
  MIN_MONEY = 1
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @all_journeys= []
  end

  def topup(value)
    fail "Your balance cannot go over £#{Oystercard::MAX_MONEY}." if @balance + value > MAX_MONEY
    @balance += value
  end

  def touch_in(station)
    fail "min. balance of £#{Oystercard::MIN_MONEY} not reached" if @balance <= MIN_MONEY
    @journey = { :in => station }
    @entry_station= station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @entry_station = nil
    @exit_station = station
    @journey[:out] = station
    @all_journeys << journey
  end

  def on_journey?
    !!@entry_station
  end

  private
  def deduct(fare)
    @balance -= fare
  end

end
