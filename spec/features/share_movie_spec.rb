require "rails_helper"

RSpec.feature "Share movie", :type => :feature do
  before :each do
    @user = FactoryBot.create(:user)
  end

  scenario "Valid URL" do
    # Login
    visit "/"
    find("li", text: "LOGIN/REGISTER").click

    expect(page).to have_content("Sign in to continue")
    fill_in "username", :with => @user.username
    fill_in "password", :with => @user.password
    click_button "Login"

    # Click share button & type url on input
    find(".upload").click
    expect(page).to have_content("Enter Youtube URL")
    fill_in "url", :with => ENV["VALID_YOUTUBE_URL"]

    # Preview click
    find("#preview-button").click

    # Share movie
    find("#share-button").click

    # Wait until modal disappear
    expect(page).to have_no_css(".modal", wait: 20)

    # Database check
    movie = Movie.first
    expect(movie).not_to be_nil

    ## Movie must be belong to current user
    expect(movie.user_id).to eq(@user.id)

    ## Movie info
    expect(movie.youtube_video_id).to eq(ENV["VALID_YOUTUBE_ID"])
    expect(movie.title).to eq(ENV["VIDEO_TITLE"])
    expect(movie.like_count).to eq(0)
    expect(movie.dislike_count).to eq(0)

    # Frontend check: home
    expect(page).to have_content(ENV["VIDEO_TITLE"])
    expect(page).to have_content("BY #{@user.username.upcase}")
    expect(page.find(".movie-thumbnail img")["data-src"]).to have_content movie.thumbnail

    # Frontend check: mypage
    visit "/my_movies"

    expect(page).to have_content("My Movies")
    expect(page).to have_content(ENV["VIDEO_TITLE"])
    expect(page.find(".movie-thumbnail img")["data-src"]).to have_content movie.thumbnail
  end
end
