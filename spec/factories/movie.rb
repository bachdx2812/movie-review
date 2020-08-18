FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    description { Faker::Movie.quote }
    youtube_video_id { ENV["VALID_YOUTUBE_ID"] }
    association :user
  end
end
