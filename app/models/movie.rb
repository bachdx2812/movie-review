# == Schema Information
#
# Table name: movies
#
#  id               :bigint           not null, primary key
#  description      :text(65535)
#  dislike_count    :integer          default(0), not null
#  like_count       :integer          default(0), not null
#  published_at     :datetime
#  thumbnail        :string(255)
#  title            :string(255)      default(""), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer          not null
#  youtube_video_id :string(255)      not null
#
# Indexes
#
#  index_movies_on_userid  (user_id)
#

class Movie < ApplicationRecord
  belongs_to :user
  has_many :rate_histories

  def update_counter!
    summary = rate_histories.group(:rate_type).count(:id)

    update!(
      dislike_count: summary["dislike"] || 0,
      like_count: summary["like"] || 0,
    )
  end
end
