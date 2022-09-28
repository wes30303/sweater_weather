class MapsFacade

  def self.get_location(location)
    data = MapsService.get_location(location)
    Map.new(data)
  end

  def self.get_directions(from, to)
    parsed_json = MapsService.get_directions(from, to)
    if parsed_json[:info][:messages].include?('We are unable to route with the given locations.')
      'This is impossible route'
    else
      parsed_json[:route][:formattedTime]
    end
  end

  def self.create_eta(destination, time)
    if time == 'This is impossible route'
    else
      location = MapsFacade.get_location(destination)
      cut_time = time.split(':').first.to_i
      whether = WhetherService.get_whether(location)
      ForecastAtArrival.new(whether, cut_time)
    end
  end
end
