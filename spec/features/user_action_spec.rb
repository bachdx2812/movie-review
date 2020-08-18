require "rails_helper"

RSpec.feature "Rate action", :type => :feature do
  before :each do
    @user = User.create(username: "test", password: "1")
    @movie = FactoryBot.create(:movie)
  end

  scenario "Login & Logout" do
    # Login
    visit "/"
    find("li", text: "LOGIN/REGISTER").click

    fill_in "username", :with => @user.username
    fill_in "password", :with => @user.password
    click_button "Login"

    expect(page).to have_text("UPLOAD MOVIE")
    # Logout
    find("small", text: "HI").click
    find("a", text: "LOGOUT").click
    expect(page).to have_text("LOGIN/REGISTER")
  end

  scenario "Like video" do
    # Login
    visit "/"
    find("li", text: "LOGIN/REGISTER").click
    fill_in "username", :with => @user.username
    fill_in "password", :with => @user.password
    click_button "Login"

    # Like
    find("#like_#{@movie.id}").click
    expect(page).to have_css(".active")

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

    rate = RateHistory.find_by(movie_id: @movie.id)
    expect(rate).not_to be_nil
    expect(rate.dislike?).to eq(true)
    expect(rate.user_id).to eq(@user.id)
  end
end
