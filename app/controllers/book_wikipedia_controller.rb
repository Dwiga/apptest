class BookWikipediaController < ApplicationController
    def update
        @book = Book.find(params[:book_id])
        wikipedium = @book.book_wikipedium
        if wikipedium.update(book_wikipedium_data)
            redirect_to @book
        else
            render "books/edit", status: :unprocessable_entity
        end
    end

    private
        def book_wikipedium_data
            params.require(:book_wikipedium).permit(:found, :url, :year)
        end
end
