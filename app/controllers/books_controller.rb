class BooksController < ApplicationController
    def index
        @pagy, @records = pagy(Book.includes(:author))
    end

    def view
        @book = Book.includes(:images, :similar_books, :book_tags, :author).find(params[:id])
    end
end
