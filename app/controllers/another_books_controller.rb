class AnotherBooksController < ApplicationController
    def new
        @book = Book.find(params[:book_id])
    end

    def create
        @book = Book.find(params[:book_id])
        another_book_id = helpers.another_book_checker(another_book_data)
        similar_book = SimilarBook.new(book_id: @book.id, another_book_id: another_book_id)
        if similar_book.save
            redirect_to @book
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
        def another_book_data
            params.require(:another_book).permit(:name)
        end
end
