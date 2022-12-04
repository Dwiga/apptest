require 'rails_helper'
require "books_helper"

# Specs in this file have access to a helper object that includes
# the BooksHelper. For example:
#
# describe BooksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe BooksHelper, type: :helper do
  context "given a list of number in string" do
    it "returns a list of integers" do
      list = ["1", "2", "3"]
      expect(list[0]).to be_a(String)
      result = string_list_to_integer(list)
      expect(result[0]).to be_a(Integer)
    end
  end

  context "given a list of alphabet" do
    it "returns error" do
      list = ["a", "b", "c"]
      expect(list[0]).to be_a(String)
      expect{ string_list_to_integer(list) }.to raise_error("Required numeric string")
    end
  end

  context "given nil" do
    it "returns empty list" do
      list = nil
      result = string_list_to_integer(list)
      expect(result).to eql([])
    end
  end
end
