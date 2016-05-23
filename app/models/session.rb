class Session < ActiveRecord::Base
  validates :token, uniqueness: true, presence: true
  validates :user, presence: true

  belongs_to :user

  def self.auth_with_credentials(username, password)
    user = User.find_by(username: username).try(:authenticate, password)

    if user
      self.create_session user
    else
      raise UnauthorizedError.new
    end
  end

  def self.auth_with_token(token)
    session = Session.find_by token: token

    if session
      session
    else
      raise UnauthorizedError.new
    end
  end

  protected
  def self.generate_token
    SecureRandom.base64 20
  end

  def self.create_session(user)
    Session.create! user: user, token: self.generate_unique_token
  end

  def self.generate_unique_token
    token = self.generate_token

    while Session.find_by token: token
      token = self.generate_token
    end

    token
  end
end