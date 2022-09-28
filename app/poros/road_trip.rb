class RoadTrip
  attr_reader :id, :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(from, to)
    @id = nil
    @start_city = from
    @end_city = to
    @travel_time = MapsFacade.get_directions(from, to)
    @weather_at_eta = MapsFacade.create_eta(to, @travel_time)
  end
end
