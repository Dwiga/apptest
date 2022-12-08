require 'rails_helper'

RSpec.describe BookWikipedium, type: :model do
  context "Store data to BookWikipedium" do
    it "found shoul not empty" do
      author = create(:author)
      book = create(:book, author: author)
      book_wikipedium = BookWikipedium.new(url: "https://en.wikipedia.org/wiki/Anthem_(novella)", found: "", year: -1, book_id: book.id)
      expect(book_wikipedium).to_not be_valid
      book_wikipedium.found = true
      expect(book_wikipedium).to be_valid
    end
  end
end
