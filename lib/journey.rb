class Journey

attr_reader :single_journey, :all_journeys

  def initialize
    @all_journeys = []
    @single_journey = {}
  end

  def store_entry(station)
    @single_journey[:in] = station
  end

  def store_exit(station)
    @entry_station = nil
    @single_journey[:out] = station
    @all_journeys << single_journey
  end

  def on_journey?
    !!@entry_station
  end

end
