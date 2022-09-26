require 'rails_helper'

RSpec.describe Book do

  it 'is able to get books from the poros', :vcr do
    books = BooksFacade.get_books('Denver, co', 3)
    book = books.first

    expect(book.first).to be_a(Book)
    expect(book.first.isbn).to be_a Array
    expect(book.first.isbn).to eq(["9780607620054", "0607620056"])
    expect(book.first.title).to be_a String
    expect(book.first.title).to eq("Denver west, CO and Bailey, CO: Denver, CO")
    expect(book.first.publisher[0]).to be_a String
    expect(book.first.publisher[0]).to eq("USGS Branch of Distribution")
  end

  before :each do
    @data = {
      "isbn": ["9780607620054", "0607620056"],
      "title": 'Denver Co',
      "publisher": "Spinelli's co ",
    }

    @books = Book.new(@data)
  end

  it 'exists' do
    expect(@books).to be_a(Book)
  end

  it "has attributes" do
    expect(@books.isbn).to eq(["9780607620054", "0607620056"])
    expect(@books.title).to eq('Denver Co')
    expect(@books.publisher).to eq("Spinelli's co ")
  end

end
