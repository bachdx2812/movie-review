require "rails_helper"

describe "GET movies", :type => :request do
  before {
    i = 1
    while i <= 20 do
      FactoryBot.create(:user, :with_movie)
      i += 1
    end
  }
  before { get "/api/movies/search.json?page=1" }
  page_size = ENV["DEFAULT_PER_PAGE"]

  it "returns movie arrays & paging info" do
    data = JSON.parse(response.body)
    movies = data["movies"]
    meta = data["meta"]

    expect(movies.class).to eq(Array)
    expect(movies.size).to eq(page_size.to_i)
    expect(meta["page"]).to eq(1)
  end
  it "returns status code 200" do
    expect(response).to have_http_status(:success)
  end

  it "newest to first list" do
    max_id = Movie.last.id
    data = JSON.parse(response.body)
    movies = data["movies"]

    expect(movies.first["id"]).to eq(max_id)
  end
end
