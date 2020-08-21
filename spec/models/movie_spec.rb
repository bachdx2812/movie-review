require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "Associations" do
    it "belongs to user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe "Validations" do
    subject { FactoryBot.create :movie }

    it "is valid with valid attributes" do
      is_expected.to be_valid
    end

    it "has one after adding one" do
      instance_double("Movie")
    end

    it "like&dislike is zero after create" do
      expect(subject.like_count).to eq(0)
      expect(subject.dislike_count).to eq(0)
    end

    it "is not valid without youtube_video_id" do
      subject.youtube_video_id = nil
      is_expected.to_not be_valid
    end

    it "is not valid without title" do
      subject.title = nil
      is_expected.to_not be_valid
    end
  end

  describe "Methods" do
    subject { FactoryBot.create :movie }
    context "update_counter" do
      it "do not update like when rate history not created" do
        expect(subject.like_count).to eq(0)
        expect(subject.dislike_count).to eq(0)

        subject.update_counter!
        expect(subject.like_count).to eq(0)
        expect(subject.dislike_count).to eq(0)
      end

      it "increment like_count when after like" do
        expect(subject.like_count).to eq(0)
        expect(subject.dislike_count).to eq(0)
        RateHistory.create(user_id: subject.user_id, movie_id: subject.id, rate_type: :like)
        subject.update_counter!

        expect(subject.like_count).to eq(1)
        expect(subject.dislike_count).to eq(0)
      end

      it "increment dislike_count when after dislike" do
        expect(subject.like_count).to eq(0)
        expect(subject.dislike_count).to eq(0)
        RateHistory.create(user_id: subject.user_id, movie_id: subject.id, rate_type: :dislike)
        subject.update_counter!

        expect(subject.like_count).to eq(0)
        expect(subject.dislike_count).to eq(1)
      end
    end
  end
end
