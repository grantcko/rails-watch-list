class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = List.find(@list.id)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
    # raise
  end

  def destroy
    @controllers
  end
end

private

def bookmark_params
  params.require(:bookmark).permit(:comment, :movie_id)
end
