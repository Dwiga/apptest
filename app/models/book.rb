class Book < ApplicationRecord
    belongs_to :author
    has_many :image_urls
    has_many :images
    has_many :book_genres
    has_many :genres, :through => :book_genres
    has_one :book_wikipedium
    has_one :good_read
    has_one :gutenberg
    has_many :similar_books
    has_many :another_books, :through => :similar_books
    has_many :book_tags
    has_many :tags, :through => :book_tags
end
