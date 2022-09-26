require 'rails_helper'

RSpec.describe Book do

  it 'is able to get books from the poros', :vcr do
    books = BooksFacade.get_books('Denver, co', 3)
    book = books.first

    expect(book).to be_a(Book)
    expect(book.isbn).to be_a Array
    expect(book.isbn).to eq(["9780607620054", "0607620056"])
    expect(book.title).to be_a String
    expect(book.title).to eq("Denver west, CO and Bailey, CO: Denver, CO")
    expect(book.publisher).to be_a String
    expect(book.publisher).to eq("Denver west, CO and Bailey, CO: Denver, CO")
  end
end
