require "rails_helper"

RSpec.describe User, type: :model do
  describe "associations" do
    it {should have_one(:profile).dependent(:destroy)}
    it {should have_many(:bookmarks).dependent(:destroy)}
    it {should have_many(:reviews).dependent(:destroy)}
    it {should have_many(:likes).dependent(:destroy)}
    it {should have_many(:comments).dependent(:destroy)}
    it {should have_many(:active_relationships)
      .with_foreign_key(:follower_id).dependent(:destroy)
      .class_name("Relationship")}
    it {should have_many(:passive_relationships)
      .with_foreign_key(:following_id).dependent(:destroy)
      .class_name("Relationship")}
    it {should have_many(:sended_notifications)
      .with_foreign_key(:sender_id).dependent(:destroy)
      .class_name("Notification")}
    it {should have_many(:received_notifications)
      .with_foreign_key(:receiver_id).dependent(:destroy)
      .class_name("Notification")}
    it {should have_many(:sended_requests)
      .with_foreign_key(:user_id).dependent(:destroy)
      .class_name("Request")}
    it {should have_many(:following).through(:active_relationships)}
    it {should have_many(:followers).through(:passive_relationships)
      .source(:follower)}
    it {should have_many(:checked_requests)
      .with_foreign_key(:admin_id).dependent(:destroy)
      .class_name("Request")}
  end

  describe "authentication" do
    it "redirect to root path after auth" do
      user = User.from_omniauth OmniAuth.config.mock_auth[:facebook]
      expect user != nil
    end
  end
end
