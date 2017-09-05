class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :following_id, dependent: :destroy
  has_many :following, through: :active_relationships
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :sended_notifications, class_name: Notification.name,
    foreign_key: :sender_id, dependent: :destroy
  has_many :received_notifications, class_name: Notification.name,
    foreign_key: :receiver_id, dependent: :destroy
  has_many :sended_requests, class_name: Request.name,
    foreign_key: :user_id, dependent: :destroy
  has_many :checked_requests, class_name: Request.name,
    foreign_key: :admin_id, dependent: :destroy
end
