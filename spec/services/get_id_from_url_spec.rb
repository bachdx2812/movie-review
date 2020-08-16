RSpec.describe "GetIdFromUrl", type: :service, skip: true do
  describe "Get video id from url successs" do
    it "should return id" do
      service = Youtube::GetIdFromUrl.new(ENV["VALID_YOUTUBE_URL"])
      @video_id = service.execute

      expect(@video_id).to eq ENV["VALID_YOUTUBE_ID"]
    end
  end

  describe "Get id from url fail" do
    it "should raie exception if url isn't youtube" do
      expect { Youtube::GetIdFromUrl.new(ENV["IS_NOT_YOUTUBE_URL"]).execute }.to raise_error(FetchIdFromYoutubeUrlError)
    end

    it "should raie exception if empty url" do
      expect { Youtube::GetIdFromUrl.new("").execute }.to raise_error(FetchIdFromYoutubeUrlError)
    end

    it "should raise exception with url without id" do
      expect { Youtube::GetIdFromUrl.new(ENV["NOT_INCLUDE_ID_URL"]).execute }.to raise_error(FetchIdFromYoutubeUrlError)
    end
  end
end
