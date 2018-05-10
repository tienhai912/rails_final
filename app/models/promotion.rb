class Promotion < ApplicationRecord
  has_many :product_promotions, dependent: :destroy
  has_many :products, through: :product_promotions

  validates :start_date, presence: true
  validates :end_date, presence: true
end
