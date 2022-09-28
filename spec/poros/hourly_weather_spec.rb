require 'rails_helper'

RSpec.describe HourlyWeather, :vcr do
  it 'exists with attributes' do
    cord = MapsFacade.get_location("denver, co")
    search = WhetherService.get_whether(cord)
    current = HourlyWeather.new(search[:hourly][0])

    expect(current).to be_a HourlyWeather
    expect(current.time).to be_a String
    expect(current.temp).to be_a Float
    expect(current.description).to be_a String
    expect(current.icon).to be_a String
  end
end
