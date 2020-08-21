require "rails_helper"

RSpec.feature "Auth feature", :type => :feature do
  before :each do
    @user = User.create(username: "vutaka", password: "123456")
    @movie = FactoryBot.create(:movie)
  end

  scenario "Login & Logout" do
    # Login
    visit "/"
    find("li", text: "LOGIN/REGISTER").click

    expect(page).to have_content("Sign in to continue")
    fill_in "username", :with => @user.username
    fill_in "password", :with => @user.password
    click_button "Login"

    expect(page).to have_text("SHARE MOVIE")
    expect(page).to have_no_content("LOGIN/REGISTER")

    # Logout
    find("small", text: "HI").click
    find("a", text: "LOGOUT").click
    expect(page).to have_text("LOGIN/REGISTER")
  end
end
