class BookmarksController < ApplicationController
  before_action :find_book, only: %i(create update destroy)
  before_action :find_book_mark, only: %i(update destroy)

  attr_reader :book, :book_mark

  def create
    @book_mark = current_user.bookmarks.create book: book

    if book_mark
      response_result
    else
      flash[:danger] = t "books.bookmark_error"
    end
  end

  def update
    if (params[:favorite] and book_mark.is_favorite!) ||
      (!params[:favorite] and book_mark.not_favorite!)
      response_result
    else
      flash[:danger] = t "books.favorite_error"
    end
  end

  def destroy
    if book_mark.destroy
      response_result
    else
      flash[:danger] = t "books.unbookmark_error"
    end
  end

  private

  def bookmark_params
    params.permit Bookmark::CREATE_PARAMS
  end

  def response_result
    respond_to do |format|
      format.html{redirect_to :back}
      format.js
    end
  end

  def find_book
    @book = Book.find_by id: params[:id]
    render_not_found unless @book
  end

  def find_book_mark
    @book_mark = current_user.bookmarks.find_by book_id: params[:id]
  end
end
