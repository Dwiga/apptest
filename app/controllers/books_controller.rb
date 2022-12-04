class BooksController < ApplicationController
    def index
        min = params["minimum"]
        max = params["maximum"]
        list_authors = helpers.string_list_to_integer(params["authors"])

        @authors = Author.all

        result = helpers.query(min, max, list_authors)
        @pagy, @records = pagy(result)
    end

    def show
        @book = Book.includes(:images, :similar_books, :book_tags, :author).find(params[:id])
    end

    def edit
        @book = Book.includes(:book_wikipedium, :author, :images, :good_read, :similar_books, :gutenberg, :book_tags).find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_data)
            redirect_to @book
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private
        def book_data
            params.require(:book).permit(
                :original_title,
                :title,
                :content_name,
                :isbn,
                :year,
                :language_code,
                :category,
                :plot,
                :copyright,
                :average_rating,
                :rating_count,
                :description,
                :loc_class,
                :pages,
                :language,
                :isbn13,
                :release_date,
                :cover,
                :summary,
                :content_cleaned,
                :content_available,
                :n_authors
            )
        end
end
