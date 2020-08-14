# == Schema Information
#
# Table name: rate_histories
#
#  id         :bigint           not null, primary key
#  rate_type  :integer          default(1), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_movies_on_userid  (user_id) UNIQUE
#

class RateHistory < ApplicationRecord
end
