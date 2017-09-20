class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  delegate :name, to: :user, prefix: true
end
