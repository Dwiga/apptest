require 'rails_helper'

RSpec.describe "BookWikipedia", type: :request do
  context "PATCH /books/:book_id/book_wikipedia/:id" do
    it "redirects to book's view after update" do
      author = create(:author)
      book = create(:book, author: author)
      book_wikipedium = create(:book_wikipedium, book: book)
      patch "/books/#{book.id}/book_wikipedia/#{book_wikipedium.id}", params: {book_wikipedium: {url: "https://en.wikipedia.org/wiki/A_Princess_of_Mars", year: 1, found: false}}
      follow_redirect!
      expect(result).to render_template(:show)
    end
  end
end
