class Api::V1::ForcastController < ApplicationController

  def index
    maps = MapsFacade.get_location(forecast_params)
    whether = WhetherFacade.create_whether(maps)
    render json: WhetherSerializer.new(whether)
  end

  private
    def forecast_params
      params.permit(:location)
    end
end
