require "rails_helper"

RSpec.describe User, type: :model do
  # describe "Associations" do
  #   it "has many movies" do
  #     association = described_class.reflect_on_association(:movies)
  #     expect(association.macro).to eq :has_many
  #   end
  # end

  describe "Validations" do
    subject { FactoryBot.create :user }

    it "is valid with valid attributes" do
      is_expected.to be_valid
    end

    it "has one after adding one" do
      instance_double("User")
    end

    it "does not allow duplicate username" do
      user_duplicate = User.new(username: subject.username)
      expect(user_duplicate.valid?).to eq false
    end

    it "is not valid without a username" do
      subject.username = nil
      is_expected.to_not be_valid
    end
  end
   # instance method...
   # methods & scopes
end
