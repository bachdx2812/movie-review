module Youtube
  class GetIdFromUrl
    def initialize(url)
      @url = url
    end

    def execute
      valid_url = url.match(/.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=)([^#\&\?]*).*/)
      raise FetchIdFromYoutubeUrlError.new("Url must be a valid youtube, #{url}") unless valid_url

      id = valid_url[1]
      raise FetchIdFromYoutubeUrlError.new("cant fetch Id from this url, #{url}") unless id

      id
    end

    attr_reader :url
  end
end
