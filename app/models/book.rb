class Book < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :book_categories, as: :book, dependent: :destroy
  has_many :reviews, ->{order(created_at: :desc)}, dependent: :destroy

  validates :title, presence: true, length: {maximum: Settings.name_max}
  validates :publish_date, presence: true
  validates :author, presence: true
  validates :pages, presence: true
  validates :description, presence: true,
    length: {maximum: Settings.description_max}
  validates :cover, presence: true
end
