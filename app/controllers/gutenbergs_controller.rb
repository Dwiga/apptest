class GutenbergsController < ApplicationController
    def update
        @book = Book.find(params[:book_id])
        gutenberg = @book.gutenberg
        if gutenberg.update(gutenberg_data)
            redirect_to @book
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private
        def gutenberg_data
            params.require(:gutenberg).permit(:url, :num)
        end
end
