require 'rails_helper'

RSpec.describe DailyWeather, :vcr do
  it 'exists with attributes' do
    cord = MapsFacade.get_location("denver, co")
    search = WhetherService.get_whether(cord)
    current = DailyWeather.new(search[:daily][0])

    expect(current).to be_a DailyWeather
    expect(current.date).to be_a String
    expect(current.sunrise).to be_a Time
    expect(current.sunset).to be_a Time
    expect(current.max).to be_a Float
    expect(current.min).to be_a Float
    expect(current.description).to be_a String
    expect(current.icon).to be_a String
  end
end
