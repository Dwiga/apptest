class Genre < ApplicationRecord
    has_many :books, :through => :book_genres
end
