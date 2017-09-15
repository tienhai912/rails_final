class BooksController < ApplicationController
  before_action :load_require_index, only: :index

  def index; end

  private

  def load_require_index
    @books_support = Supports::BookSupport
      .new books: Book.all, param: params
  end
end
