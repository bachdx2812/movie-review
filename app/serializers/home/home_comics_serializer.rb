module Home
  class HomeComicsSerializer < ActiveModel::Serializer
    attributes :id,
               :title,
               :copyright_title,
               :author,
               :year_start,
               :year_end,
               :year_end,
               :volumes_collected,
               :volumes_total,
               :ongoing,
               :finished,
               :thumbnail

    belongs_to :publisher
  end
end
