class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  belongs_to :user

  validates :active, inclusion: {in: [false, true]}

  before_save :update_price

  def subtotal
    order_items.collect { |item| item.valid? ? (item.total) : 0 }.sum
  end

  private
  def update_price
    self.price = subtotal
  end
end
