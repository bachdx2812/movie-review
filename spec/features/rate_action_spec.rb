require "rails_helper"

RSpec.feature "Rate action", :type => :feature do
  before :each do
    @user = FactoryBot.create(:user)
    @movie = FactoryBot.create(:movie)
  end

  context "When logged in user" do
    scenario "Like video" do
      # Login
      visit "/"
      find("li", text: "LOGIN/REGISTER").click

      expect(page).to have_content("Sign in to continue")
      fill_in "username", :with => @user.username
      fill_in "password", :with => @user.password
      click_button "Login"

      # Like
      find("#like_#{@movie.id}").click
      expect(page).to have_css(".active")

      # Check database result
      rate = RateHistory.find_by(movie_id: @movie.id)
      expect(rate).not_to be_nil
      expect(rate.like?).to eq(true)
      expect(rate.user_id).to eq(@user.id)
    end

    scenario "Dislike video" do
      # Login
      visit "/"
      find("li", text: "LOGIN/REGISTER").click
      fill_in "username", :with => @user.username
      fill_in "password", :with => @user.password
      click_button "Login"

      find("#dislike_#{@movie.id}").click
      expect(page).to have_css(".active")

      # Check database result
      rate = RateHistory.find_by(movie_id: @movie.id)
      expect(rate).not_to be_nil
      expect(rate.dislike?).to eq(true)
      expect(rate.user_id).to eq(@user.id)
    end
  end

  context "When not logged in user" do
    scenario "Like video must be required login" do
      visit "/"
      # Like
      find("#like_#{@movie.id}").click
      expect(page).to have_css(".active")

      # Frontend must be show login modal
      expect(page).to have_content("Sign in to continue")

      # Check database result => No RateHistory created
      rate = RateHistory.find_by(movie_id: @movie.id)
      expect(rate).to be_nil
    end

    scenario "Dislike video must be required login" do
      visit "/"
      # Dislike click
      find("#dislike_#{@movie.id}").click
      expect(page).to have_css(".active")

      # Frontend must be show login modal
      expect(page).to have_content("Sign in to continue")

      # Check database result => No RateHistory created
      rate = RateHistory.find_by(movie_id: @movie.id)
      expect(rate).to be_nil
    end
  end
end
