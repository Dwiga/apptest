require 'rails_helper'

RSpec.describe "Authors", type: :request do
  before do
    author = create(:author)
    wikipedium = create(:wikipedium, author: author)
  end
  describe "GET /authors/:id" do
    it "return author's single page" do
      get "/authors/1"
      expect(response).to render_template(:show)
    end
  end
end
