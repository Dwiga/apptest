class BookWikipedium < ApplicationRecord
  belongs_to :book
  validates :found, presence: true
end
