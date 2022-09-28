require 'rails_helper'

RSpec.describe CurrentWeather, :vcr do
  it 'exists with attributes' do
    cord = MapsFacade.get_location("denver, co")
    search = WhetherService.get_whether(cord)


    current = CurrentWeather.new(search[:current])

    expect(current).to be_a CurrentWeather
    expect(current.feels_like).to be_a Float
    expect(current.humidity).to be_a Integer
    expect(current.datetime).to be_a Time
    expect(current.sunrise).to be_a Time
    expect(current.sunset).to be_a Time
    expect(current.visibility).to be_a Integer
    expect(current.description).to be_a String
    expect(current.icon).to be_a String
    expect(current.temp).to be_a Float
    expect(current.uvi).to_not be_a String
  end
end
