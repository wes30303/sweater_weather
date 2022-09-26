class Api::V1::BookController < ApplicationController

  def index
   location = params[:location]
   quantity = params[:quantity]

   books = BooksFacade.get_books(location, quantity)
   forecast = BooksWhetherFacade.get_forecast(location)

   render json: BookSerializer.book_search(books, forecast, location)
 end


end
