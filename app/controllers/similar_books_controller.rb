class SimilarBooksController < ApplicationController
    def destroy
        @book = Book.find(params[:book_id])
        @similar_book = SimilarBook.find(params[:id])
        if @similar_book.destroy
            redirect_to @book
        else
            render "books/edit"
        end
    end
end
