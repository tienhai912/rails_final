module Supports
  class BookmarkSupport
    attr_reader :bookmarks, :books_id_fav,
      :books_id_reading, :books_id_finish

    def initialize arg
      @bookmarks = arg[:bookmarks]
    end

    def book_ids_fav
      @books_id_fav = []
      bookmarks.each do |bookmark|
        books_id_fav.push bookmark.book_id if bookmark.is_favorite?
      end
      books_id_fav
    end

    def book_ids_reading
      @books_id_reading = []
      bookmarks.each do |bookmark|
        books_id_reading.push bookmark.book_id if bookmark.reading?
      end
      books_id_reading
    end

    def book_ids_finish
      @books_id_finish = []
      bookmarks.each do |bookmark|
        books_id_finish.push bookmark.book_id if bookmark.finish?
      end
      books_id_finish
    end
  end
end
