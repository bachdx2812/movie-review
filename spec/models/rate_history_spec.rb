require "rails_helper"

RSpec.describe RateHistory, type: :model do
  describe "Associations" do
    it "should belongs to user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it "should belongs to user" do
      association = described_class.reflect_on_association(:movie)
      expect(association.macro).to eq :belongs_to
    end
  end
end
