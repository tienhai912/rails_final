class Category < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :book_categories, dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.name_max}
  validates :description, presence: true,
    length: {maximum: Settings.description_max}
end
