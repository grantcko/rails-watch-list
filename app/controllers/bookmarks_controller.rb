class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to :lists_path
    else
      render :new
    end
    render :new, status: :unprocessable_entity
  end

  def destroy

  end
end

private

def bookmark_params
  params.require(:bookmarks).permit(:comment)
end
