class ImagesController < ApplicationController
    def new
        @book = Book.find(params[:book_id])
    end

    def create
        @book = Book.find(params[:book_id])
        if @book.images.create(iamge_data)
            redirect_to @book
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @book = Book.find(params[:book_id])
        @image = Image.find(params[:id])
        if @image.destroy
            redirect_to @book
        end
    end

    private
        def iamge_data
            params.require(:image).permit(:url)
        end
end
