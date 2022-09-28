require 'rails_helper'

RSpec.describe RoadTrip do
  it 'exists with attributes', :vcr do
    road_trip = RoadTrip.new('denver,co', 'Texas')

    expect(road_trip).to be_a RoadTrip

    expect(road_trip.id).to eq nil
    expect(road_trip.start_city).to be_a String
    expect(road_trip.start_city).to eq 'denver,co'
    expect(road_trip.end_city).to be_a String
    expect(road_trip.end_city).to eq 'Texas'
    expect(road_trip.travel_time).to be_a String
    expect(road_trip.weather_at_eta).to be_a ForecastAtArrival
  end

  it 'returns even with impossible route', :vcr do
    road_trip = RoadTrip.new('denver,co', 'Hawaii')

    expect(road_trip).to be_a RoadTrip

    expect(road_trip.id).to eq nil
    expect(road_trip.start_city).to be_a String
    expect(road_trip.start_city).to eq 'denver,co'
    expect(road_trip.end_city).to be_a String
    expect(road_trip.end_city).to eq 'Hawaii'
    expect(road_trip.travel_time).to be_a String
    expect(road_trip.travel_time).to eq 'This is impossible route'
    expect(road_trip.weather_at_eta).to eq nil
  end
end
