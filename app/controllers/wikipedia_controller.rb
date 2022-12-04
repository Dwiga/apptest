class WikipediaController < ApplicationController
  def update
    @author = Author.find(params[:author_id])
    @wikipedium = @author.wikipedium
    if @wikipedium.update(wikipedium_data)
      redirect_to @author
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def wikipedium_data
      params.require(:wikipedium).permit(:found, :url)
    end
end
