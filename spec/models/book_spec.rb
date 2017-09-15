require "rails_helper"

RSpec.describe Book, type: :model do
  describe "associations" do
    it {should have_many(:bookmarks).dependent(:destroy)}
    it {should have_many(:reviews).dependent(:destroy)}
    it {should belong_to(:category)}
  end
end
