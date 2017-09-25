class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :book

  CREATE_PARAMS = %i(:user_id, :book_id,
    :start_read, :finish_read).freeze

  enum status: %i(not_read reading finish).freeze
  enum favorite: %i(not_favorite is_favorite).freeze
end
