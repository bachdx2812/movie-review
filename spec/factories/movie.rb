FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    description { Faker::Movie.quote }
    youtube_url { ENV["VALID_YOUTUBE_URL"] }
    like_count { Faker::Number.number(digits: 2) }
    dislike_count { Faker::Number.number(digits: 2) }

    association :user
  end
end
