require 'rails_helper'

describe BooksService do
  context "class methods" do
    context "find books" do
      it "returns books", :vcr do

        book = BooksService.get_books("denver, co", 3)

        expect(book).to be_a Hash
        expect(book).to have_key(:numFound)
        expect(book[:docs]).to be_a Array
        expect(book[:docs][0]).to have_key(:title)
        expect(book[:docs][0]).to have_key(:publisher)
      end
    end
  end
end
