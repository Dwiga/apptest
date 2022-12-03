class AuthorsController < ApplicationController
    def view
        @author = Author.includes(:wikipedium, :books).find(params[:id])
    end
end
