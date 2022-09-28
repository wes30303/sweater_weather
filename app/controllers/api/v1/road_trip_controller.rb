class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    binding.pry
    if user.present?
      trip = RoadTrip.new(params[:origin], params[:destination])
      render json: RoadTripSerializer.new(trip)
    else
      render json: { error: 'Api Key Incorrect or Missing' }, status: 401
    end
  end
end
