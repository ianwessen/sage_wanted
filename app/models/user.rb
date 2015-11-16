# User class
class User < ActiveRecord::Base
  attr_accessor :remember_token
  before_save { self.email = email.downcase }

  has_secure_password

  validates :email,      presence: true,
                         length: { maximum: 64 },
                         uniqueness: true

  validates :password,   presence: true,
                         length: { minimum: 6 }

  validates :last_name,  presence: true,
                         length: { in: 2..32 }

  validates :first_name, presence: true,
                         length: { in: 2..32 }

  # Returns full name; useful for views
  def name
    first_name + ' ' + last_name
  end

  # Following two methods used for producing tokens. These crypto tokens
  # are useful in logging in and "remembering" the user
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # This is the remember me functionality. Remembers the user for persistent
  # user sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # True if token == digest
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
