class Promotion < ApplicationRecord
  has_many :product_promotions, dependent: :destroy
  has_many :products, through: :product_promotions
end
