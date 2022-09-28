require 'rails_helper'

RSpec.describe 'It is able ', :vcr do
  xit 'returns a roadtrip when given valid key and destination' do
       user_data = {
         "email": 'ac2d@example.com',
         "password": 'bryce',
         "password_confirmation": 'bryce'
       }
       post '/api/v1/users', params: user_data

       login = {
         "email": "Pikachu@gmail.com",
         "password": "Test1234"
        }

       post '/api/v1/sessions', params: login

       parsed_user_body = JSON.parse(response.body, symbolize_names: true)
       api_key = parsed_user_body[:data][:attributes][:api_key]

       data = {
         "origin": 'New York, NY',
         "destination": 'Los Angeles,CA',
         "api_key": api_key
       }

       post '/api/v1/road_trip', params: data

       expect(response).to be_successful
     end
end
