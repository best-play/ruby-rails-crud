class User < ActiveRecord::Base
  has_secure_password

  validates :username, :email, uniqueness: true, presence: true
end
