class Category < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :requests, dependent: :destroy
end
