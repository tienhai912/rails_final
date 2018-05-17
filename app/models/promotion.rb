class Promotion < ApplicationRecord
  has_many :product_promotions, dependent: :destroy
  has_many :products, through: :product_promotions

  validates :name, presence: true
  validates :percent, presence: true, numericality: {greater_than: 0, less_than: 100}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :date_valid?

  def date_valid?
    return if start_date.blank? || end_date.blank?
    if start_date > end_date
      errors.add :start_date, I18n.t("promotions.before_end_date")
    end
  end
end
