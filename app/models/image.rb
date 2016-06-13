class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :image, presence: true
  belongs_to :user
  has_many :tasks
end