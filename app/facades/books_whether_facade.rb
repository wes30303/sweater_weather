class BooksWhetherFacade

  def self.get_forecast(location)
    coords = MapsFacade.get_location(location)
    whether = WhetherFacade.create_whether(coords)
  end

end
