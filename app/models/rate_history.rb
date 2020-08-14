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
end
