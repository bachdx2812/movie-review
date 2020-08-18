require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "Associations" do
    it "belongs to user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe "Validations" do
    subject { FactoryBot.create :user }

    it "is valid with valid attributes" do
      is_expected.to be_valid
    end

    it "has one after adding one" do
      instance_double("Movie")
    end
    it "is not valid without youtube_video_id" do
      subject.youtube_video_id = nil
      is_expected.to_not be_valid
    end
  end

  describe "Methods" do
    context "update_counter" do
      it "do not update like" do
        it "when rate history not created " do
          movie = FactoryBot.create(:movie)


        end
      end
    end
  end
end
