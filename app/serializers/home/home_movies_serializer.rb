module Home
  class HomeMoviesSerializer < ActiveModel::Serializer
    attributes :id,
               :description,
               :dislike_count,
               :like_count,
               :thumbnail,
               :title,
               :youtube_url
  end
end
