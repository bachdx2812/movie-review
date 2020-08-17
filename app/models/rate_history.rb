# == Schema Information
#
# Table name: rate_histories
#
#  id         :bigint           not null, primary key
#  rate_type  :integer          default("like"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_movies_on_userid_movieid  (user_id,movie_id) UNIQUE
#

class RateHistory < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  enum rate_type: {
    dislike: 0,
    like: 1,
  }

  after_commit :update_counter, on: [:create, :destroy]

  def update_counter
    summary = RateHistory.where(movie_id: 1).group(:rate_type).count(:id)

    movie.update(
      dislike_count: summary[:dislike] || 0,
      like_count: summary[:like] || 0,
    )
  end
end
