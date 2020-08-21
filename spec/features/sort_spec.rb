require "rails_helper"

RSpec.feature "Sort function", :type => :feature do
  before :each do
    FactoryBot.create_list(:movie, 20)
  end

  scenario "Fefault newest to first" do
    visit "/"

    # Check showing movie
    showing_movie = page.all(".movie-item")
    newest_movies = Movie.order(created_at: :desc).limit(ENV["DEFAULT_PER_PAGE"])
    @temp = ENV["DEFAULT_PER_PAGE"].to_i

    while @temp >= 0 do
      @temp -= 1
      expect(showing_movie[@temp]).to have_content(newest_movies[@temp].title)
    end
  end

  scenario "Most liked to first" do
    visit "/"
    # Click to sort
    find("span", text: "Most liked").click

    # Wait until loading disappear
    expect(page).to have_no_css(".loading")

    # Check showing movie
    showing_movie = page.all(".movie-item")
    newest_movies = Movie.order(like_count: :desc).limit(ENV["DEFAULT_PER_PAGE"])
    @temp = ENV["DEFAULT_PER_PAGE"].to_i

    while @temp >= 0 do
      @temp -= 1
      expect(showing_movie[@temp]).to have_content(newest_movies[@temp].title)
    end
  end

  scenario "Most dislike to first" do
    visit "/"
    # Click to sort
    find("span", text: "Most dislike").click

    # Wait until loading disappear
    expect(page).to have_no_css(".loading")
    showing_movie = page.all(".movie-item")

    # Check showing movie
    newest_movies = Movie.order(dislike_count: :desc).limit(ENV["DEFAULT_PER_PAGE"])
    @temp = ENV["DEFAULT_PER_PAGE"].to_i

    while @temp >= 0 do
      @temp -= 1
      expect(showing_movie[@temp]).to have_content(newest_movies[@temp].title)
    end
  end
end
