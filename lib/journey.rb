class Journey

attr_reader :journey, :all_journeys

  def initialize
    @all_journeys = []
  end

  def store_entry(station)
    @journey = { :in => station }
    @entry_station= station
  end

  def store_exit(station)
    @entry_station = nil
    @exit_station = station
    @journey[:out] = station
    @all_journeys << journey
  end

  def on_journey?
    !!@entry_station
  end

end
