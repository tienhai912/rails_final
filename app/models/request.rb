class Request < ApplicationRecord
  enum status: %i(pending approve decline)

  belongs_to :user, class_name: User.name
  belongs_to :admin, class_name: User.name

  has_many :book_categories, as: :book, dependent: :destroy

  validates :title, presence: true
  validates :publish_date, presence: true
  validates :author, presence: true
  validates :status, presence: true
end
