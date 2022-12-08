require 'rails_helper'

RSpec.describe Book, type: :model do
  context "Add a new book" do
    it "has a title" do
      author = create(:author)
      book = Book.new(title: "", author_name: "Mr. X", author_id: author.id)
      expect(book).to_not be_valid

      book.title = 'Journey to the west'
      expect(book).to be_valid
    end
  end 
end
