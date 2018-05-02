class Notification < ApplicationRecord
  belongs_to :receiver, class_name: User.name
  belongs_to :sender, class_name: User.name
  belongs_to :noti_activity, polymorphic: true

  validates :noti_activity_type, presence: true
  validates :noti_activity_id, presence: true
  validates :content, presence: true
end
