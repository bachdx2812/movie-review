require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "Associations" do
    it "belongs to user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
end
