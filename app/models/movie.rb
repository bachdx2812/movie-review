# == Schema Information
#
# Table name: movies
#
#  id            :bigint           not null, primary key
#  description   :string(255)
#  dislike_count :integer          default(0), not null
#  like_count    :integer          default(0), not null
#  published_at  :datetime
#  thumbnail     :string(255)
#  title         :string(255)      default(""), not null
#  youtube_url   :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer          not null
#
# Indexes
#
#  index_movies_on_userid  (user_id) UNIQUE
#

class Movie < ApplicationRecord
  belongs_to :user
end
