class MapsFacade

  def self.get_location(location)
    data = MapsService.get_location(location)
    Map.new(data)
  end
  
end
