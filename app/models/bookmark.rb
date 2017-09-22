class Bookmark < ApplicationRecord
  enum status: %i(not_read reading finish).freeze
  enum favorite: %i(not_favorite is_favorite).freeze

  belongs_to :user
  belongs_to :book

  has_one :finish_post, ->{where(post_activity_type: "Finish")},
    class_name: Post.name, as: :post_activity, dependent: :destroy
  has_one :favorite_post, ->{where(post_activity_type: "Favorite")},
    class_name: Post.name, as: :post_activity, dependent: :destroy

  validates :status, presence: true

  CREATE_PARAMS = %i(
    user_id
    book_id
    start_read
    finish_read
  ).freeze
end
