class User < ActiveRecord::Base
  has_secure_password

  has_many :sessions
  has_many :images
  has_many :tasks
  validates :username, :email, uniqueness: true, presence: true
end
