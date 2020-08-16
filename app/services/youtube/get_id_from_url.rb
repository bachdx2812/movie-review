module Youtube
  class GetIdFromUrl
    def initialize(url)
      @url = url
    end

    def execute
      id = url.match(/.*(?:youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=)([^#\&\?]*).*/)[1]

      raise FetchIdFromYoutubeUrlError.new("cant fetch Id from this url, #{url}") unless id

      id
    end

    attr_reader :url
  end
end
