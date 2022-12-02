class AnotherBook < ApplicationRecord
    has_many :books, :through => :similar_books
end
