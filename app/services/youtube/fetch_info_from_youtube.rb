module Youtube
  class FetchInfoFromYoutube
    YOUTUBE_API_URL = "https://www.googleapis.com/youtube/v3/videos"
    YOUTUBE_API_URL_WITHOUT_API_KEY = "https://www.youtube.com/oembed"

    def initialize(url)
      @url = url
      @request_type = ENV["YOUTUBE_API_KEY"].present? ? :api_key : :none_api_key
    end

    def execute
      @video_id = Youtube::GetIdFromUrl.new(url).execute

      request_for_infos
      structure_response
    end

    private

    attr_reader :url, :video_id, :res, :request_type

    def request_for_infos
      if request_type == :api_key
        response = RestClient.get YOUTUBE_API_URL, {
          params: {
            key: ENV["YOUTUBE_API_KEY"],
            id: video_id,
            part: "id,snippet",
          },
        }
      else
        response = RestClient.get YOUTUBE_API_URL_WITHOUT_API_KEY, {
          params: {
            url: url,
            format: "json",
          },
        }
      end

      @res = JSON.parse(response.body)
    rescue RestClient::Unauthorized, RestClient::Forbidden, RestClient::BadRequest, StandardError => e
      raise FetchVideoYoutubeError.new("Error Fetching info from this URL : #{url}, #{e.message}")
    end

    def structure_response
      if request_type == :api_key
        main_info = res.dig("items").first.dig("snippet")
        puts main_info

        {
          title: main_info.dig("title"),
          description: main_info.dig("description"),
          published_at: main_info.dig("publishedAt"),
          thumbnail: main_info.dig("thumbnails", "standard", "url"),
        }
      else
        main_info = res

        {
          title: main_info.dig("title"),
          thumbnail: main_info.dig("thumbnail_url"),
        }
      end
    end
  end
end
