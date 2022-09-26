class WhetherService
  def self.get_whether(cord)
    response = conn.get('/data/2.5/onecall') do |route|
      route.params['lat'] = cord.lat
      route.params['lon'] = cord.lon
      route.params['exclude'] = 'minutely,alerts'
      route.params['units'] = 'imperial'
    end
    parse_json(response)
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
      faraday.params['appid'] = ENV.fetch('whether_api_key', nil)
    end
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
