module Supports
  class BookSupport
    attr_reader :books, :param

    def initialize arg
      @books = arg[:books]
      @param = arg[:param]
    end

    def books_search
      search.result.page(param[:page]).per_page Settings.books.limit
    end

    def search
      books.ransack param[:q]
    end
  end
end
