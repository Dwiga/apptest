class Author < ApplicationRecord
    has_one :wikipedium, :dependent => :destroy
    has_many :books, :dependent => :destroy
end
