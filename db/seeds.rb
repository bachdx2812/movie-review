User.destroy_all
Movie.destroy_all
RateHistory.destroy_all

ActiveRecord::Base.transaction do
  i = 1

  while i <= 100 do
    user = User.create!(
      username: "#{Faker::Internet.username}#{i}",
      password: "123456",
    )

    movie = Movie.create!(
      user_id: user.id,
      title: Faker::Book.title,
      description: Faker::Lorem.paragraph(sentence_count: 10),
      youtube_video_id: "wSSE0thGmcc",
      thumbnail: Faker::LoremFlickr.image(size: "640x480"),
      published_at: Time.now,
      dislike_count: 0,
      like_count: 0,
    )

    RateHistory.create!(
        user_id: user.id,
        movie_id: movie.id,
        rate_type: [0, 1].sample,
      )

    movie.update_counter!

    i += 1
  end
end

Publisher.create!(name: "NXB Kim Đồng", logo: "https://nxbkimdong.com.vn/images/kimdongnew/logo60kd.png")
Publisher.create!(name: "NXB Trẻ", logo: "https://www.fahasa.com/media/wysiwyg/Thang-12-2018/NXB-tre.png")
Publisher.create!(name: "TVM Comics", logo: "https://lethuyxuanduong.files.wordpress.com/2015/11/logo193_400x400.png")
Publisher.create!(name: "TABooks", logo: "https://scontent-hkg4-1.xx.fbcdn.net/v/t1.0-9/56726597_2065455236886657_2486595436555534336_n.jpg?_nc_cat=107&_nc_sid=09cbfe&_nc_ohc=P5XMFtYWvR8AX_8Wx9A&_nc_ht=scontent-hkg4-1.xx&oh=ab43e53fa86251790417483f11441218&oe=5F6FBB9A")
Publisher.create!(name: "NXB Hồng Đức", logo: "https://nhasachhongduc.com.vn/img/logo.png")

# movies = Movie.all
# users = User.all

# ActiveRecord::Base.transaction do
#   movies.each do |movie|
#     users.each do |user|
#       RateHistory.create!(
#         user_id: user.id,
#         movie_id: movie.id,
#         rate_type: [0, 1].sample,
#       )
#     end

#     movie.update_counter!
#   end
# end
