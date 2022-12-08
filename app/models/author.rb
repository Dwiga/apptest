class Author < ApplicationRecord
    has_one :wikipedium, :dependent => :destroy
    has_many :books, :dependent => :destroy

    validates :name, presence: true, length: { minimum: 1 }
end
