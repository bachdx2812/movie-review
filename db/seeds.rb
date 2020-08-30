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

Publisher.create!(name: "NXB Kim Đồng", logo: "/images/publishers/kimdong.png")
Publisher.create!(name: "NXB Trẻ", logo: "/images/publishers/nxb_tre.png")
Publisher.create!(name: "TVM Comics", logo: "/images/publishers/tvm.jpg")
Publisher.create!(name: "TABooks", logo: "/images/publishers/tabooks.png")
Publisher.create!(name: "NXB Hồng Đức", logo: "/images/publishers/hongduc.png")
Publisher.create!(name: "NXB Thanh Niên", logo: "/images/publishers/thanh_nien.png")

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
