class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true

  before_save :update_total

  private
  def update_total
    self.total = self.product.price * self.quantity
    return if self.product.promotions.blank?

    self.product.promotions.each do |promo|
      self.total = self.total * (1 - promo.percent/100)
    end
  end
end
