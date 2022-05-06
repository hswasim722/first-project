class Post < ApplicationRecord
  has_many :comments
    validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  mount_uploader :image, ImageUploader
  include PgSearch
  pg_search_scope :search, against: [:title]
end
