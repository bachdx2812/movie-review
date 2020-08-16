RSpec.describe "FetchInfoFromYoutube", type: :service, skip: true do
  describe "Fetch video info from youtube success" do
    it "should return video info with valid url & API Key" do
      service = Youtube::FetchInfoFromYoutube.new(ENV["VALID_YOUTUBE_URL"])
      @video_info = service.execute

      expect(@video_info[:title]).to eq ENV["VIDEO_TITLE"]
      expect(@video_info[:description]).not_to be_nil
      expect(@video_info[:published_at]).not_to be_nil
    end

    it "should return video title with valid url & without API Key" do
      ENV["YOUTUBE_API_KEY"] = nil
      service = Youtube::FetchInfoFromYoutube.new(ENV["VALID_YOUTUBE_URL"])
      @video_info = service.execute

      expect(@video_info[:title]).to eq ENV["VIDEO_TITLE"]
    end
  end

  describe "Fetch video info from youtube fail" do
    it "should raise exception if url include invalid id (video not exist for id)" do
      service = Youtube::FetchInfoFromYoutube.new(ENV["INVALID_ID_URL"])
      expect { service.execute }.to raise_error(FetchVideoYoutubeError)
    end
  end
end
