class WhetherFacade

  def self.create_whether(cords)
    data = WhetherService.get_whether(cords)
    FullWhether.create_whether(data)
  end

end
