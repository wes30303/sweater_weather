require 'rails_helper'

RSpec.describe 'forecast endpoints' do
  it "connects to the index endpoint", :vcr do
    get '/api/v1/forcast?location=denver,co'
    # binding.pry
    response_body = JSON.parse(response.body, symbolize_names: true)
    forecast = response_body[:data]
  end
end
