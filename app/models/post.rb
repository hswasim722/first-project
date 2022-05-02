class Post < ApplicationRecord
    validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  mount_uploader :image, ImageUploader
end
