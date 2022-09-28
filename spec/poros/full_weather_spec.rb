require 'rails_helper'

RSpec.describe FullWhether, :vcr do
  it 'exists with attributes' do
    cord = MapsFacade.get_location("denver, co")
    search = WhetherService.get_whether(cord)
    current = FullWhether.create_whether(search)
    expect(current.current_weather).to be_a CurrentWeather
    expect(current.hourly_weather).to all be_a HourlyWeather
    expect(current.daily_weather).to all be_a DailyWeather
  end
end
