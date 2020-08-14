ActiveRecord::Base.transaction do
  User.destroy_all
  Movie.destroy_all
  RateHistory.destroy_all

  i = 1

  while i <= 10 do
    user = User.create!(
      username: "user#{i}",
      password: "123456",
    )

    movie = Movie.create!(
      user_id: user.id,
      title: "movie#{i}",
      description: "desc of movie #{i}",
      youtube_url: "https://www.youtube.com/",
      thumbnail: "https://via.placeholder.com/640x480.png?text=movie#{i}",
      published_at: Time.now,
      dislike_count: 0,
      like_count: 0,
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
