require 'rails_helper'

RSpec.describe 'BooksFacade' do
  it 'returns instances of food with given ingredient', :vcr do
    books = BooksFacade.get_books('Denver,co', 3)

    expect(books.first).to be_a Book
    expect(books.first.isbn).to be_a Array
    expect(books.first.title).to be_a String
    expect(books.first.publisher).to be_a String
  end

end
