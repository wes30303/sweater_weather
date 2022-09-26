class BookSerializer
  def self.book_search(books, forecast, location)
   { "data":
     {
       "id": 'null',
       "type": 'books',
       "attributes": {
         "destination": location,
         "forecast": {
           "summary": forecast.current_weather.description,
           "temperature": forecast.current_weather.feels_like
           },

       "total_books_found": books[1],
       "books": books.map do |book|
         {
           "title": book.title,
           "isbn": book.isbn,
           "publisher": book.publisher
         }
       end
       }
     }
   }
 end
end
