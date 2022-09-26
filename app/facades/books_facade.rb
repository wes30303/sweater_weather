class BooksFacade

  def self.get_books(location, limit)
    data = BooksService.get_books(location, limit)
    amount = data[:numFound]
    books = data[:docs].map do |book|
      Book.new(book)
    end
    info = [books, amount]
  end

end
