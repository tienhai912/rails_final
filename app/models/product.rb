class Product < ApplicationRecord
  has_many :product_promotions, dependent: :destroy
  has_many :promotions, through: :product_promotions
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  validates :name, presence: true
  validates :description, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates :ISBN, presence: true
  validates :code, presence: true
end
