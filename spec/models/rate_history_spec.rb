require "rails_helper"

RSpec.describe RateHistory, type: :model do
  describe "Associations" do
    it "should belongs to user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it "should belongs to movie" do
      association = described_class.reflect_on_association(:movie)
      expect(association.macro).to eq :belongs_to
    end

    it "does not allow duplicate user&video" do
      FactoryBot.create(:user, :with_movie)
      rate = RateHistory.create(user_id: User.first.id, movie_id: Movie.first.id, rate_type: [1, 0].sample)
      rate_dup = rate.dup
      expect(rate_dup.valid?).to eq false
    end
  end
end
