class DailyWeather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max,
              :min,
              :description,
              :icon

  def initialize(data)
    @date = Time.at(data[:dt]).strftime('%m/%d/%Y')
    @sunrise = Time.at(data[:sunrise])
    @sunset = Time.at(data[:sunset])
    @max = data[:temp][:max]
    @min = data[:temp][:min]
    @description = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
  end
end
