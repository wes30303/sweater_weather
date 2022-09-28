class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if !user.nil? && user.authenticate(params[:password])
      render(json: UserSerializer.new(user), status: :ok)
    else
      render(json: { message: "Username or password is Incorrect." }, status: :unauthorized)
    end
  end
end
