FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
  end

  trait :with_movie do
    after(:create) do |user|
      create(:movie, user_id: user.id)
    end
  end
end
