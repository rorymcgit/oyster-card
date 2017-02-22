class Journey

attr_reader :each_journey, :all_journeys

  def initialize
    @all_journeys = []
  end

  def store_entry(station)
    @each_journey = { :in => station }
    @entry_station = station
  end

  def store_exit(station)
    @entry_station = nil
    @exit_station = station
    @each_journey[:out] = station
    @all_journeys << each_journey
  end

  def on_journey?
    !!@entry_station
  end

end
