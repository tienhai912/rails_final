class BookCategory < ApplicationRecord
  belongs_to :book, polymorphic: true

  validates :category_id, presence: true
  validates :book_type, presence: true
  validates :book_id, presence: true
end
