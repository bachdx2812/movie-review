require "rails_helper"

RSpec.feature "Load more", :type => :feature do
  before :each do
    FactoryBot.create_list(:movie, 20)
  end

  scenario "Normal scroll" do
    visit "/"
    # The first time load => return DEFAULT_PER_PAGE item => display DEFAULT_PER_PAGE item
    expect(page).to have_css(".movie-item", count: ENV["DEFAULT_PER_PAGE"].to_i)

    # Scroll to bottom
    page.execute_script "window.scrollBy(0,10000)"
    # Loading appear
    expect(page).to have_css(".loading")
    # Loading disappear
    expect(page).to have_no_css(".loading")
    # The seconds time load => return DEFAULT_PER_PAGE item => display 2*DEFAULT_PER_PAGE item
    expect(page).to have_css(".movie-item", count: ENV["DEFAULT_PER_PAGE"].to_i * 2)

    # Do not load more item
    page.execute_script "window.scrollBy(0,10000)"
    expect(page).to have_no_css(".loading")
    expect(page).to have_css(".movie-item", count: ENV["DEFAULT_PER_PAGE"].to_i * 2)
  end

  scenario "Continuity scroll" do
    visit "/"
    # The first time load => return DEFAULT_PER_PAGE item => display DEFAULT_PER_PAGE item
    expect(page).to have_css(".movie-item", count: ENV["DEFAULT_PER_PAGE"].to_i)

    # Continuity scroll to bottom
    page.execute_script "window.scrollBy(0,10000)"
    page.execute_script "window.scrollBy(0,10000)"
    page.execute_script "window.scrollBy(0,10000)"
    page.execute_script "window.scrollBy(0,10000)"

    # Loading appear
    expect(page).to have_css(".loading")
    # Loading disappear
    expect(page).to have_no_css(".loading")
    # display 2*DEFAULT_PER_PAGE item
    expect(page).to have_css(".movie-item", count: ENV["DEFAULT_PER_PAGE"].to_i * 2)

    # Still do not load more item check
    page.execute_script "window.scrollBy(0,10000)"
    page.execute_script "window.scrollBy(0,10000)"
    page.execute_script "window.scrollBy(0,10000)"
    expect(page).to have_no_css(".loading")

    # Still display 2*DEFAULT_PER_PAGE item
    expect(page).to have_css(".movie-item", count: ENV["DEFAULT_PER_PAGE"].to_i * 2)
  end
end
