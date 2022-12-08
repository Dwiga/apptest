module AnotherBooksHelper
    def another_book_checker(name)
        another_book = AnotherBook.find_by(name)
        if another_book
            return another_book.id
        else
            return AnotherBook.create(name).id
        end
    end
end
