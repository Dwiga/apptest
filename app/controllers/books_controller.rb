class BooksController < ApplicationController
    def index
        @pagy, @records = pagy(Book.includes(:author))
    end
end
