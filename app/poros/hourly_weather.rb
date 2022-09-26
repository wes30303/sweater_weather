class HourlyWeather
  attr_reader :time,
              :temp,
              :description,
              :icon

  def initialize(data)
    @time = Time.at(data[:dt]).strftime('%I:%M%p')
    @temp = data[:temp]
    @description = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
