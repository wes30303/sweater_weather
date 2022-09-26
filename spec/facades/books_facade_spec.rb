require 'rails_helper'

RSpec.describe 'BooksFacade' do
  it 'returns instances of food with given ingredient', :vcr do
    books = BooksFacade.get_books('Denver,co', 3)
    book = books.first

    expect(book.first).to be_a Book
    expect(book.first.isbn).to be_a Array
    expect(book.first.title).to be_a String
    expect(book.first.publisher[0]).to be_a String
  end

  it 'is able to test how many books are comming back', :vcr do
    books = BooksFacade.get_books('Denver,co', 3)
    book = books.first

    expect(book).to be_a Array
    expect(book.length).to eq(3)
  end

end
