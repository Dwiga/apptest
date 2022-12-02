class Tag < ApplicationRecord
    has_many :books, :through => :book_tags
end
