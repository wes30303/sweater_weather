require 'rails_helper'

RSpec.describe 'books endpoints' do
  it "connects to the index endpoint", :vcr do
    get '/api/v1/book-search?location=denver,co&quantity=5'
    # binding.pry
    response_body = JSON.parse(response.body, symbolize_names: true)
    forecast = response_body[:data]
    expect(response).to be_successful

    expect(forecast[:id]).to eq("null")
    expect(forecast[:type]).to eq('books')
    expect(forecast[:attributes]).to be_a Hash
    expect(forecast[:attributes][:forecast]).to be_a Hash
    expect(forecast[:attributes][:forecast][:summary]).to be_a String
    expect(forecast[:attributes][:forecast][:temperature]).to be_a Float

    expect(forecast[:attributes][:total_books_found]).to be_a Hash
    expect(forecast[:attributes][:total_books_found][:title]).to be_a String
    expect(forecast[:attributes][:total_books_found][:publisher]).to be_a String

  end
end
