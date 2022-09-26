require 'rails_helper'

RSpec.describe 'books endpoints' do
  it "connects to the index endpoint", :vcr do
    get '/api/v1/book-search?location=denver,co&quantity=5'
    # binding.pry
    response_body = JSON.parse(response.body, symbolize_names: true)
    forecast = response_body[:data]
  end
end
