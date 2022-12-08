require 'rails_helper'

RSpec.describe BookWikipedium, type: :model do
  context "Store data to BookWikipedium" do
    let!(:author) { create(:author) }
    let!(:book) { create(:book, author: author) }
    let!(:book_wikipedium) { create(:book_wikipedium, book: book) }
    it "found should not empty" do
      book_wikipedium = BookWikipedium.new(url: "https://en.wikipedia.org/wiki/Anthem_(novella)", found: "", year: -1, book_id: book.id)
      expect(book_wikipedium).to_not be_valid
      book_wikipedium.found = true
      expect(book_wikipedium).to be_valid
    end
  end
end
