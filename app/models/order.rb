class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user

  validates :price, presence: true
end
