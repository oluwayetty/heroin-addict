class Status < ApplicationRecord
  belongs_to :user
  validates :body, presence: true

  mount_uploader :image, ImageUploader
  mount_uploader :video, VideoUploader

  validates_integrity_of :image
  validates_integrity_of :video
end
