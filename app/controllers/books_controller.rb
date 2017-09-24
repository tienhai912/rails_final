class BooksController < ApplicationController
  before_action :load_require_index, only: :index
  before_action :find_book, only: :show

  attr_reader :book, :bookmarks, :books_had_bookmarked

  def index
    @bookmarks = current_user.bookmarks.is_favorite
    @books_had_bookmarked = []
    bookmarks.each do |bookmark|
      books_had_bookmarked.push bookmark.book_id
    end
  end

  def show
    @review_list = book.reviews.page(params[:page])
      .per_page Settings.books.review
  end

  private

  def find_book
    @book = Book.find_by id: params[:id]

    return if book
    flash[:danger] = t "books.not_found"
    redirect_to books(locale: params[:locale])
  end

  def load_require_index
    @books_support = Supports::BookSupport
      .new books: Book.all, param: params
  end
end
