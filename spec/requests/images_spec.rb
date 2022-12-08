require 'rails_helper'

RSpec.describe "Images", type: :request do
  context "POST /books/:book_id/images" do
    it "redirect to book's view" do
      author = create(:author)
      book = create(:book, author: author)
      wikipedium = create(:wikipedium, author: author)

      post "/books/#{book.id}/images", :params => { :image => { url: "https://upload.wikimedia.org/wikipedia/commons/3/3c/Preparing_and_slicing_carrots.jpg" }}
      follow_redirect!

      expect(response).to render_template(:show)
    end
  end
end
