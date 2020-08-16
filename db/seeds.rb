ActiveRecord::Base.transaction do
  User.destroy_all
  Movie.destroy_all
  RateHistory.destroy_all

  i = 1

  while i <= 100 do
    user = User.create!(
      username: Faker::Internet.username,
      password: "123456",
    )

    movie = Movie.create!(
      user_id: user.id,
      title: Faker::Book.title,
      description: Faker::Lorem.paragraph(sentence_count: 10),
      youtube_url: "https://www.youtube.com/",
      thumbnail: Faker::LoremFlickr.image(size: "640x480"),
      published_at: Time.now,
      dislike_count: Faker::Number.number(digits: 2),
      like_count: Faker::Number.number(digits: 2),
    )

    i += 1
  end

  movies = Movie.all
  users = User.all

  movies.each do |movie|
    users.each do |user|
      RateHistory.create!(
        user_id: user.id,
        movie_id: movie.id,
        rate_type: [0, 1].sample,
      )
    end
  end
end
