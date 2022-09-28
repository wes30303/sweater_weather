require 'rails_helper'

RSpec.describe 'It is able ' do
  it 'can login a user', :vcr do
    user = {
      email: 'Pikachu@gmail.com',
      password: 'Test1234',
      password_confirmation: 'Test1234'
      }

    post '/api/v1/users', params: user

    expect(response).to be_successful
    expect(response.status).to be(201)
  end

  it 'grab the users data' do

    headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }

    user_params = {
      "email": 'Pikachu@gmail.com',
      "password": "test1234",
      "password_confirmation": "test1234"
    }

    post '/api/v1/users', headers: headers, params: JSON.generate(user_params)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(result).to have_key(:data)

    data = result[:data]

    expect(data).to have_key(:type)
    expect(data[:type]).to eq("users")
    expect(data).to have_key(:id)
    expect(data[:id]).to be_a String
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a Hash
    expect(data[:attributes]).to have_key(:email)
    expect(data[:attributes]).to have_key(:api_key)
    expect(data[:attributes][:email]).to be_a String
    expect(data[:attributes][:api_key]).to be_a String
  end

  describe 'sad path' do

     it 'cant create user without email' do
       headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
       user_params = {
         "password": "test1234",
         "password_confirmation": "test1234"
       }
       post api_v1_users_path, headers: headers, params: user_params.to_json
       expect(User.count).to eq(0)
       expect(response).to_not be_successful
       expect(response.status).to eq(401)
     end

     it 'cant create user without password' do
       headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
       user_params = {
         "email": 'pikachu@gmail.com',
       }
       post api_v1_users_path, headers: headers, params: user_params.to_json
       expect(User.count).to eq(0)
       expect(response).to_not be_successful
       expect(response.status).to eq(401)
     end

     it 'passwords must be the same' do
       headers = { 'CONTENT_TYPE' => 'application/json', "Accept" => 'application/json' }
       user_params = {
         "email": 'pikachu@gmail.com',
         "password": "test1234",
         "password_confirmation": "test124"
       }
       post api_v1_users_path, headers: headers, params: user_params.to_json
       expect(User.count).to eq(0)
       expect(response).to_not be_successful
       expect(response.status).to eq(401)
     end
   end
end
