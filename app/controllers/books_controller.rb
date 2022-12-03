class BooksController < ApplicationController
    def index
        min = params["minimum"]
        max = params["maximum"]
        list_authors = helpers.string_list_to_integer(params["authors"])

        @authors = Author.all

        result = helpers.query(min, max, list_authors)
        @pagy, @records = pagy(result)
    end

    def view
        @book = Book.includes(:images, :similar_books, :book_tags, :author).find(params[:id])
    end
end
