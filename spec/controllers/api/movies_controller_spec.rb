require "rails_helper"

RSpec.describe "MoviesController" do
  context "GET movies", :type => :request do
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

  context "logged in user", :type => :request do
    login_user
    it "first time like must be success" do
      movie = FactoryBot.create(:movie)
      post "/api/movies/#{movie.id}/like"

      expect(response).to have_http_status(:success)
    end

    it "first time dislike must be success" do
      movie = FactoryBot.create(:movie)
      post "/api/movies/#{movie.id}/dislike"

      expect(response).to have_http_status(:success)
    end

    it "duplicate like must be return unprocessable_entity" do
      movie = FactoryBot.create(:movie)
      post "/api/movies/#{movie.id}/like"
      expect(response).to have_http_status(:success)

      post "/api/movies/#{movie.id}/like"
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "duplicate dislike must be return unprocessable_entity" do
      movie = FactoryBot.create(:movie)
      post "/api/movies/#{movie.id}/dislike"
      expect(response).to have_http_status(:success)

      post "/api/movies/#{movie.id}/dislike"
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  context "not logged in user", :type => :request do
    it "like must be return unauthorized" do
      movie = FactoryBot.create(:movie)
      post "/api/movies/#{movie.id}/like"

      expect(response).to have_http_status(:unauthorized)
    end

    it "dislike must be return unauthorized" do
      movie = FactoryBot.create(:movie)
      post "/api/movies/#{movie.id}/dislike"

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
