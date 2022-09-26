class BooksService
  def self.get_books(location, limit)
    response = conn.get('/search.json') do |route|
      route.params['q'] = location
      route.params['limit'] = limit
    end
    parse_json(response)
  end

  private

  def self.conn
    Faraday.new(url: 'https://openlibrary.org')
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
