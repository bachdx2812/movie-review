module Youtube
  class FetchInfoFromYoutube
    YOUTUBE_API_URL = "https://www.googleapis.com/youtube/v3/videos"

    def initialize(url)
      @url = url
    end

    def execute
      @video_id = Youtube::GetIdFromUrl.new(url).execute

      request_for_infos
      structure_response
    end

    private

    attr_reader :url, :video_id, :res

    def request_for_infos
      response = RestClient.get YOUTUBE_API_URL, { params: { key: ENV["YOUTUBE_API_KEY"], id: @video_id, part: "id,snippet" } }
      @res = JSON.parse(response.body)
    rescue RestClient::Unauthorized, RestClient::Forbidden, RestClient::BadRequest, StandardError => e
      raise FetchInfoFromYoutubeError.new("Error Fetching info from this URL : #{url}, #{e.message}")
    end

    def structure_response
      main_info = res.dig("items").first.dig("snippet")

      {
        title: main_info.dig("title"),
        description: main_info.dig("description"),
        published_at: main_info.dig("publishedAt"),
        thumbnail: main_info.dig("thumbnails", "details", "standard"),
      }
    end
  end
end
