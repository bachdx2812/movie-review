module Home
  class HomeMoviesSerializer < ActiveModel::Serializer
    attributes :id,
               :description,
               :dislike_count,
               :like_count,
               :thumbnail,
               :title,
               :youtube_url,
               :published_at,
               :username

    def username
      object.user.username
    end
  end
end
