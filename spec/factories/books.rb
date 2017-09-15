FactoryGirl.define do
  factory :book do
    sequence(:title) {|n| "title#{n}"}
    author "AAAAAA"
    publish_date "2017-09-15"
    pages 123
    cover "https://www.w3schools.com/css/img_fjords.jpg"
    description "this is a test book"
  end
end
