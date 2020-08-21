require "rails_helper"

RSpec.feature "Sort function", :type => :feature do
  before :each do
    i = 1
    while i <= 20
      movie = FactoryBot.build(:movie)
      movie.like_count = rand(1...100)
      movie.dislike_count = rand(1...100)
      i += 1
      movie.save
    end
    # FactoryBot.create_list(:movie, 20)
  end

  scenario "Fefault newest to first" do
    visit "/"

    # Check showing movie
    newest_movies = Movie.order(created_at: :desc).limit(ENV["DEFAULT_PER_PAGE"])
    @temp = 0
    while @temp < ENV["DEFAULT_PER_PAGE"].to_i do
      page.find(:xpath, "(//div[@class='movie-title'])[#{@temp + 1}]").should have_content(newest_movies[@temp].title)
      @temp += 1
    end
  end

  scenario "Most liked to first" do
    visit "/"
    # Click to sort
    find("span", text: "Most liked").click

    # Wait until loading disappear
    expect(page).to have_no_css(".loading")

    # Check showing movie
    newest_movies = Movie.order(like_count: :desc).limit(ENV["DEFAULT_PER_PAGE"])
    @temp = 0

    while @temp < ENV["DEFAULT_PER_PAGE"].to_i do
      page.find(:xpath, "(//div[@class='movie-title'])[#{@temp + 1}]").should have_content(newest_movies[@temp].title)
      @temp += 1
    end
  end

  scenario "Most dislike to first" do
    visit "/"
    # Click to sort
    find("span", text: "Most dislike").click

    # Wait until loading disappear
    expect(page).to have_no_css(".loading")

    # Check showing movie
    newest_movies = Movie.order(dislike_count: :desc).limit(ENV["DEFAULT_PER_PAGE"])
    @temp = ENV["DEFAULT_PER_PAGE"].to_i
    @temp = 0

    while @temp < ENV["DEFAULT_PER_PAGE"].to_i do
      page.find(:xpath, "(//div[@class='movie-title'])[#{@temp + 1}]").should have_content(newest_movies[@temp].title)
      @temp += 1
    end
  end
end
