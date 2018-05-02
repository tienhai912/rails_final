class Relationship < ApplicationRecord
  belongs_to :following, class_name: User.name
  belongs_to :follower, class_name: User.name

  has_many :posts, as: :post_activity, dependent: :destroy
end
