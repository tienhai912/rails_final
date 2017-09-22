class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :book

  CREATE_PARAMS = %i(:user_id, :book_id,
    :start_read, :finish_read).freeze

  enum status: %i(not_read reading finish).freeze

  get_favorite = lambda do |book_id, user_id|
    bookmark = find_by book_id: book_id, user_id: user_id
    bookmark.favorite if bookmark
  end

  scope :current_user_bookmark_book, -> book_id, user_id {
    find_by book_id: book_id, user_id: user_id}

  scope :get_favorite, get_favorite
end
