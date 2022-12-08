require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /" do
    it "returns home page" do
      get "/"
      expect(response).to render_template(:index)
    end
  end
end
