require "rails_helper"

RSpec.feature "Rate action", :type => :feature do
  before :each do
    @user = User.create(username: "test", password: "1")
    @movie = FactoryBot.create(:movie)
  end

  scenario "Login & Logout" do
    visit "/users/sign_in"

    fill_in "user_username", :with => "test"
    fill_in "user_password", :with => "1"
    click_button "Log in"

    expect(page).to have_text("Signed in successfully.")

    click_link "Logout"
    expect(page).to have_text("Signed out successfully.")
  end

  scenario "Like video" do
    visit "/users/sign_in"

    fill_in "user_username", :with => "test"
    fill_in "user_password", :with => "1"
    click_button "Log in"

    find("#like_#{@movie.id}").click
    expect(page).to have_css(".active")

    rate = RateHistory.find_by(movie_id: @movie.id)
    expect(rate).not_to be_nil
    expect(rate.like?).to eq(true)
    expect(rate.user_id).to eq(@user.id)
  end

  scenario "Dislike video" do
    visit "/users/sign_in"

    fill_in "user_username", :with => "test"
    fill_in "user_password", :with => "1"
    click_button "Log in"

    find("#dislike_#{@movie.id}").click
    expect(page).to have_css(".active")

    rate = RateHistory.find_by(movie_id: @movie.id)
    expect(rate).not_to be_nil
    expect(rate.dislike?).to eq(true)
    expect(rate.user_id).to eq(@user.id)
  end
end
