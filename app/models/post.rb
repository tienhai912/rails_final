class Post < ApplicationRecord
  belongs_to :user
  belongs_to :post_activity, polymorphic: true

  has_many :likes, as: :like_activity, dependent: :destroy
  has_many :notifications, as: :noti_activity, dependent: :destroy

  validates :post_activity_type, presence: true
  validates :post_activity_id, presence: true
  validates :content, presence: true
end
