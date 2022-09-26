require 'rails_helper'

RSpec.describe 'BooksFacade' do
  it 'is able to give the information for books', :vcr do
    books = BooksFacade.get_books('Denver,co', 3)
    book = books.first

    expect(book.first).to be_a Book
    expect(book.first.isbn).to be_a Array
    expect(book.first.title).to be_a String
    expect(book.first.publisher[0]).to be_a String
  end

  it 'is able to give the information for books', :vcr do
    books = BooksFacade.get_books('Denver,co', 3)
    book = books.first

    expect(book[1]).to be_a Book
    expect(book[1].isbn).to eq(["0762557362", "9780762557363"])
    expect(book[1].title).to eq("Denver Co Deluxe Flip Map")
    expect(book[1].publisher).to eq(["Universal Map Enterprises"])
  end

  it 'is able to test how many books are comming back', :vcr do
    books = BooksFacade.get_books('Denver,co', 3)
    book = books.first

    expect(book).to be_a Array
    expect(book.length).to eq(3)
  end

end
