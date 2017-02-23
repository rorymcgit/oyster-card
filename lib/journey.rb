class Journey

  MINIMUM_FARE = 3
  PENALTY_CHARGE = 6

  attr_reader :single_journey, :all_journeys

  def initialize
    @all_journeys = []
    @single_journey = {}
  end

  def store_entry(station, card)
    @card = card
    @in = true
    @single_journey[:in] = station
  end

  def store_exit(station, card)
    @card = card
    @in = false
    @single_journey[:out] = station
    @all_journeys << single_journey
  end

  # def on_journey?
  #   !!@in
  # end

  def touch_in_charge
    PENALTY_CHARGE if @in
  end

  def touch_out_charge
    @in ? MINIMUM_FARE : PENALTY_CHARGE
  end

end
