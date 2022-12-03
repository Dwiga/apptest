class BooksController < ApplicationController
    def index
        min = params["minimum"]
        max = params["maximum"]
        a = params["authors"] ? params["authors"].reject(&:empty?).map(&:to_i) : []

        @authors = Author.all

        if a.empty?
            if min.present? and max.empty?
                @pagy, @records = pagy(Book.includes(:author).where("books.pages >= ?", min))
            elsif max.present? and min.empty?
                @pagy, @records = pagy(Book.includes(:author).where("books.pages <= ?", max))
            elsif max.present? and min.present?
                @pagy, @records = pagy(Book.includes(:author).where("books.pages between ? and ?", min, max)) 
            else
                @pagy, @records = pagy(Book.includes(:author))
            end
        elsif a.present?
            @pagy, @records = pagy(Book.includes(:author).where(author: { id: a }))
        else
            @pagy, @records = pagy(Book.includes(:author))
        end
    end

    def view
        @book = Book.includes(:images, :similar_books, :book_tags, :author).find(params[:id])
    end
end
