module Home
  class HomeMoviesSerializer < ActiveModel::Serializer
    attributes :id,
               :description,
               :dislike_count,
               :like_count,
               :thumbnail,
               :title,
               :embed_url,
               :published_at,
               :username,
               :rate,
               :created_at

    def username
      object.user.username
    end

    def rate
      user_id = instance_options[:current_user]&.id
      return nil unless user_id

      object.rate_histories.detect { |rh| rh.user_id == user_id }&.rate_type
    end

    def embed_url
      "https://www.youtube.com/embed/#{object.youtube_video_id}"
    end
  end
end
