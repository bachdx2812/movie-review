require "rails_helper"

RSpec.describe "Movies API" do
  context "GET list", :type => :request do
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
      max_id = Movie.order(created_at: :desc).last.id
      data = JSON.parse(response.body)
      movies = data["movies"]

      # expect(movies.first["id"]).to eq(max_id)
    end
  end

  context "when logged in user", :type => :request do
    login_user
    context "rate movie" do
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

    context "share movie" do
      it "preview success with vide info" do
        get "/api/movies/youtube", params: { url: ENV["VALID_YOUTUBE_URL"] }

        data = JSON.parse(response.body)

        expect(response).to have_http_status(:success)
        expect(data["title"]).to eq(ENV["VIDEO_TITLE"])
        expect(data["description"]).not_to be_nil
        expect(data["published_at"]).not_to be_nil
        expect(data["youtube_video_id"]).not_to be_nil
        expect(data["thumbnail"]).not_to be_nil
      end

      it "create must success" do
        get "/api/movies/youtube", params: { url: ENV["VALID_YOUTUBE_URL"] }

        video_info = JSON.parse(response.body)

        post "/api/movies", params: video_info

        movie = Movie.first
        expect(response).to have_http_status(:success)
        expect(video_info["title"]).to eq(movie.title)
        expect(video_info["description"]).to eq(movie.description)
        expect(video_info["youtube_video_id"]).to eq(movie.youtube_video_id)
        expect(video_info["thumbnail"]).to eq(movie.thumbnail)
        expect(video_info["published_at"].to_date).to eq(movie.published_at.to_date)
      end
    end
  end

  context "when not logged in user", :type => :request do
    context "rate movie" do
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

    context "share movie" do
      it "preview fail cause unauthorized" do
        get "/api/movies/youtube", params: { url: ENV["VALID_YOUTUBE_URL"] }

        expect(response).to have_http_status(:unauthorized)
      end

      it "create fail cause unauthorized" do
        video_info = { title: "test", youtube_video_id: "test", thumbnail: "test", published_at: Time.now}

        post "/api/movies", params: video_info
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end

