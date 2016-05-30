class User < ActiveRecord::Base
  has_secure_password

  has_many :sessions
  has_many :images
  validates :username, :email, uniqueness: true, presence: true
end
