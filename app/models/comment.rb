class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :sub_comment, polymorphic: true

  has_many :comments, as: :sub_comment, dependent: :destroy
  has_many :likes, as: :like_activity, dependent: :destroy
  has_one :post, as: :post_activity, dependent: :destroy

  validates :sub_comment_type, presence: true
  validates :sub_comment_id, presence: true
  validates :content, presence: true
end
