require 'rails_helper'

RSpec.describe 'MapsFacade' do
  it 'returns instances of food with given ingredient', :vcr do
    maps = MapsFacade.get_location('Denver,co')

    expect(maps).to be_a Map
  end

  it "is able to get time", :vcr do
    maps = MapsFacade.get_directions('Denver,co', 'Texas')

    expect(maps).to be_a String
  end

  it "is able to fail is the route is not their", :vcr do
    maps = MapsFacade.get_directions('Denver,co', 'new zealand')
    expect(maps).to eq("This is impossible route")
  end

  it "is able to get make sure it is created", :vcr do
    maps = MapsFacade.create_eta('Denver,co', '00:01:20')

    expect(maps).to be_a ForecastAtArrival
  end

  it "is able to get make sure it is created at higher times", :vcr do
    maps = MapsFacade.create_eta('Denver,co', '80:01:20')

    expect(maps).to be_a ForecastAtArrival
  end

end
