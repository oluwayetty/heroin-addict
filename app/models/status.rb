class Status < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader
end
