require 'rails_helper'

RSpec.describe 'is able to create a sessions' do
  before :each do
    user = {
      email: 'Pikachu@gmail.com',
      password: 'Test1234',
      password_confirmation: 'Test1234'
      }

    post '/api/v1/users', params: user

  end

  it "is coming back with a user" do
    expect(User.count).to eq(1)
  end

  it "is able to get login infomation and post it and create a session" do
    login = {
      "email": "Pikachu@gmail.com",
      "password": "Test1234"
     }

    post '/api/v1/sessions', params: login

    expect(response).to be_successful
    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(result).to have_key(:data)

    data = result[:data]

    expect(data).to have_key(:id)
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
    it "it can fail if the email is not being entered " do
        login = {
        "email": "",
        "password": "test"
        }

        post '/api/v1/sessions', params: login

        expect(response).to_not be_successful
    end

    it "can test for password not being give and fail" do
        login = {
        "email": "test",
        "password": ""
        }

        post '/api/v1/sessions', params: login

        expect(response).to_not be_successful
    end
  end
end
