class BooksFacade

  def self.get_books(location, limit)
    data = BooksService.get_books(location, limit)
    books = data[:docs].map do |book|
      Book.new(book)
    end
  end

end
