class Like < ApplicationRecord
  belongs_to :user
  belongs_to :like_activity, polymorphic: true

  has_many :notifications, as: :noti_activity, dependent: :destroy

  validates :like_activity_type, presence: true
  validates :like_activity_id, presence: true
end
