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
           "temperature": forecast.current_weather.feels_like.to_s
           },

       "total_books_found": books[1],
       "books": books[0].map do |book|
         {
           "isbn": book.isbn,
           "title": book.title,
           "publisher": book.publisher
         }
       end
       }
     }
   }
 end
end
