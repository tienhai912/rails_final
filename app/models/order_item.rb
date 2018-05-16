class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true

  before_save :update_total

  private
  def update_total
    self.total = self.product.price * self.quantity
  end
end
