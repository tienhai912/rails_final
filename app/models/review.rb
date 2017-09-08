class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  delegate :name, to: :user, prefix: true

  has_many :comments, as: :sub_comment, dependent: :destroy
  has_many :likes, as: :like_activity, dependent: :destroy
  has_one :post, as: :post_activity, dependent: :destroy

  validates :content, presence: true
end
