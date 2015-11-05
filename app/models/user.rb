# User class
class User < ActiveRecord::Base

  before_save { self.email = email.downcase }

  has_secure_password

  validates :email, presence: true,
                    length: { maximum: 64 },
                    uniqueness: true

  validates :password, presence: true,
                       length: { minimum: 6 }

  validates :last_name, presence: true,
                        length: { in: 2..32 }

  validates :first_name, presence: true,
                         length: { in: 2..32 }


end
