class Comic < ApplicationRecord
  belongs_to :publisher

  mount_uploader :thumbnail, ImageUploader
end
