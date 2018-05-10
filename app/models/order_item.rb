class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :total, presence: true
  validates :quantity, presence: true
end
