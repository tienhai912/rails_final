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
      (!params[:favorite] and !params[:status] and book_mark.not_favorite!) ||
      (params[:status] == "0" and book_mark.not_read!) ||
      (params[:status] == "1" and book_mark.reading!) ||
      (params[:status] == "2" and book_mark.finish!)
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

  def response_result
    respond_to do |format|
      format.html{redirect_to :back}
      format.js
    end
  end

  def find_book
    @book = Book.find_by id: params[:id]

    return if book
    flash[:danger] = t "books.not_found"
    redirect_to :back
  end

  def find_book_mark
    @book_mark = current_user.bookmarks.find_by book_id: params[:id]

    return if book_mark
    flash[:danger] = t "books.not_found"
    redirect_to :back
  end
end
