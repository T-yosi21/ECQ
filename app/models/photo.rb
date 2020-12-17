class Photo < ApplicationRecord
  belongs_to :post
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  has_many :likes, dependent: :destroy
  # has_many :liking_users, through: :likes, source: :user
end
