class Task < ActiveRecord::Base
  validates :user, :image, :operation, :params, :status, presence: true

  belongs_to :user
  belongs_to :image
end