class GoodReadsController < ApplicationController
    def update
        @book = Book.find(params[:book_id])
        good_read = @book.good_read
        if good_read.update(good_read_data)
            redirect_to @book
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private
        def good_read_data
            params.require(:good_read).permit(:url, :found, :year)
        end
end
