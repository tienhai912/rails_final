50.times do |n|
  name = Faker::Name.name
  email = "user#{n+1}@123.com"
  password = "123123"
  User.create! name: name, email: email, password: password,
    password_confirmation: password, admin: false
end

User.create! name: "admin", email: "admin@123.com",
  password: "123123", admin: true
User.create! name: "admin1", email: "admin1@123.com",
  password: "123123", admin: true
User.create! name: "admin2", email: "admin2@123.com",
  password: "123123", admin: true
User.create! name: "admin3", email: "admin3@123.com",
  password: "123123", admin: true

category_sample = ["Action", "Fiction", "Mystery", "Thriller", "Romance",
  "Horror", "Historical", "Adventure", "Comedy", "Poetry"]

10.times do |n|
  name = category_sample[n]
  description = Faker::Hipster.sentence
  Category.create! name: name, description: description
end

50.times do |n|
  title = Faker::Book.title
  author = Faker::Book.author
  pages = Faker::Number.between 50, 500
  publish_date = Faker::Time.between 10.years.ago, 1.year.ago, :all
  cover = Faker::Avatar.image
  description = Faker::Hipster.sentence
  category_id = n/5
  Book.create! title: title, author: author, pages: pages,
    publish_date: publish_date, cover: cover, description: description
end

5.times do |n|
  3.times do |m|
    user_id = n + 1
    book_id = m + 1
    favorite = false
    status = "not_read"
    Bookmark.create! user_id: user_id, book_id: book_id, favorite: favorite,
      status: status
  end

  3.times do |m|
    user_id = n + 1
    book_id = m * 2 + 1
    favorite = false
    status = "reading"
    start_read = Faker::Time.between 2.days.ago, Date.today, :all
    Bookmark.create! user_id: user_id, book_id: book_id, favorite: favorite,
      status: status, start_read: start_read
  end

  3.times do |m|
    user_id = n + 1
    book_id = m * 3 +1
    favorite = false
    status = "finish"
    start_read = Faker::Time.between 10.days.ago, 3.days.ago, :all
    finish_read = Faker::Time.between 2.days.ago, Date.today, :all
    bookmark = Bookmark.create! user_id: user_id, book_id: book_id, favorite: favorite,
      status: status, start_read: start_read, finish_read: finish_read
    Post.create! user_id: user_id, post_activity_type: "Finish", post_activity_id: bookmark.id,
      content: "#{bookmark.user.name} has finished #{bookmark.book.title}"
  end

  3.times do |m|
    user_id = n + 1
    book_id = m * 4 + 1
    favorite = true
    status = "finish"
    start_read = Faker::Time.between 10.days.ago, 3.days.ago, :all
    finish_read = Faker::Time.between 2.days.ago, Date.today, :all
    bookmark = Bookmark.create! user_id: user_id, book_id: book_id, favorite: favorite,
      status: status, start_read: start_read, finish_read: finish_read
    Post.create! user_id: user_id, post_activity_type: "Finish", post_activity_id: bookmark.id,
      content: "#{bookmark.user.name} has finished #{bookmark.book.title}"
    Post.create! user_id: user_id, post_activity_type: "Favorite", post_activity_id: bookmark.id,
      content: "#{bookmark.user.name} has added #{bookmark.book.title}
      to his/her favorite list"
  end
end

54.times do |n|
  user_id = n + 1
  birthday = Faker::Time.between 60.years.ago, 20.years.ago, :all
  phone = Faker::Number.number 10
  Profile.create! user_id: user_id, birthday: birthday, phone: phone
end

10.times do |n|
  10.times do |m|
    if m != n
      relationship = Relationship.create! follower_id: n + 1, following_id: m + 1
      Post.create! user_id: n + 1, post_activity_type: "Relationship",
        post_activity_id: Relationship.last.id,
        content: "#{relationship.follower.name} is following
          #{relationship.following.name}"
    end
  end
end

10.times do |n|
  user_id = n + 1
  book_id = n + 1
  user_id_2 = n + 2
  content = Faker::Hipster.paragraph
  content_2 = Faker::Hipster.paragraph
  review_1 = Review.create! user_id: user_id, book_id: book_id, content: content
  review_2 = Review.create! user_id: user_id_2, book_id: book_id, content: content_2
  Post.create! user_id: user_id, post_activity_type: "Review", post_activity_id: review_1.id,
    content: "#{review_1.user.name} has reviewed #{review_1.book.title}"
  Post.create! user_id: user_id, post_activity_type: "Review", post_activity_id: review_2.id,
    content: "#{review_2.user.name} has reviewed #{review_2.book.title}"
end

5.times do |n|
  user_id = n/2
  title = Faker::Book.title
  author = Faker::Book.author
  pages = Faker::Number.between 50, 500
  publish_date = Faker::Time.between 10.years.ago, 1.year.ago, :all
  cover = Faker::Avatar.image
  description = Faker::Hipster.sentence
  status_1 = "pending"
  status_2 = "approve"
  status_3 = "decline"
  admin_id = 51 + n
  admin_note_2 = "Approve"
  admin_note_3 = "Decline"
  Request.create! title: title, author: author, pages: pages, user_id: user_id,
    publish_date: publish_date, cover: cover, description: description,
    status: status_1
  Request.create! title: title, author: author, pages: pages, user_id: user_id,
    publish_date: publish_date, cover: cover, description: description,
    status: status_2, admin_id: admin_id, admin_note: admin_note_2
  Request.create! title: title, author: author, pages: pages, user_id: user_id,
    publish_date: publish_date, cover: cover, description: description,
    status: status_3, admin_id: admin_id, admin_note: admin_note_3
end

5.times do |n|
  5.times do |m|
    book_type = "Book"
    book_id = n + 1
    category_id = m + n  + 1
    BookCategory.create! book_type: book_type, book_id: book_id,
      category_id: category_id
  end

  5.times do |m|
    book_type = "Request"
    book_id = n + 1
    category_id = m + n + 1
    BookCategory.create! book_type: book_type, book_id: book_id,
      category_id: category_id
  end
end

20.times do |n|
  2.times do |m|
    sub_comment_type = "Review"
    sub_comment_id = n + 1
    user_id = n + m + 1
    content = Faker::Hipster.sentence
    comment = Comment.create! sub_comment_type: sub_comment_type,
      sub_comment_id: sub_comment_id, user_id: user_id, content: content
    Post.create! user_id: user_id, post_activity_type: "Review", post_activity_id: comment.id,
      content: "#{comment.user.name} has commended on a review about
      comment.sub_comment.book.title"
  end

  2.times do |m|
    sub_comment_type = "Comment"
    sub_comment_id = n + 1
    user_id = n + m + 1
    content = Faker::Hipster.sentence
    comment = Comment.create! sub_comment_type: sub_comment_type,
      sub_comment_id: sub_comment_id, user_id: user_id, content: content
    Post.create! user_id: user_id, post_activity_type: "Review", post_activity_id: comment.id,
      content: "#{comment.user.name} has commended on a comment
      #{comment.sub_comment.id}"
  end
end

10.times do |n|
  user_id = n + 1
  activity_1 = "Review"
  activity_2 = "Comment"
  activity_3 = "Post"
  like_activity_id = n + 1
  Like.create! user_id: user_id, like_activity_type: activity_1,
   like_activity_id: like_activity_id
  Like.create! user_id: user_id, like_activity_type: activity_2,
    like_activity_id: like_activity_id
  Like.create! user_id: user_id, like_activity_type: activity_3,
    like_activity_id: like_activity_id
end

10.times do |n|
  sender_1 = Post.find_by(id: n + 1).user
  sender_2 = Like.find_by(id: n + 1).user
  activity_1 = "Post"
  activity_2 = "Like"
  activity_id = n + 1
  read = false
  content = Faker::Hipster.sentence

  sender_1.followers.each do |receiver|
    Notification.create! noti_activity_type: activity_1,
      noti_activity_id: activity_id, receiver_id: receiver.id,
      sender_id: sender_1.id, content: content, read: read
  end

  sender_2.followers.each do |receiver|
    Notification.create! noti_activity_type: activity_2,
      noti_activity_id: activity_id, receiver_id: receiver.id,
      sender_id: sender_2.id, content: content, read: read
  end
end
