class AuthorsController < ApplicationController
    def show
        @author = Author.includes(:wikipedium, :books).find(params[:id])
    end

    def edit
        @author = Author.includes(:wikipedium, :books).find(params[:id])
    end

    def update
        @author = Author.find(params[:id])
        if @author.update(author_params)
            redirect_to @author
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private
        def author_params
            params.require(:author).permit(:name, :bio, :gender, :n_books, :summary)
        end
end
