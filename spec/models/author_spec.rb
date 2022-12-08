require 'rails_helper'
require 'faker'

RSpec.describe Author, type: :model do
  context "Add author's data" do
    it "has name minimum 1 characters" do
      author = Author.new(name: "")
      expect(author).to_not be_valid
      author.name = Faker::Book.author
      expect(author).to be_valid
    end
  end
end
