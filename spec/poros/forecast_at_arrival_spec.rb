require 'rails_helper'

RSpec.describe ForecastAtArrival, :vcr do
  it 'exists with attributes' do
    cord = MapsFacade.get_location("denver, co")
    search = WhetherService.get_whether(cord)

    forecast = ForecastAtArrival.new(search, 10)

    expect(forecast).to be_a ForecastAtArrival
  end
end
