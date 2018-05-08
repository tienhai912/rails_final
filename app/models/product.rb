class Product < ApplicationRecord
  has_many :product_promotions, dependent: :destroy
  has_many :promotions, through: :product_promotions
end
