# User class
class User < ActiveRecord::Base
  validates :first_name, presence: true,
                         length: { in: 2..32 }

  validates :last_name, presence: true,
                        length: { in: 2..32 }

  validates :email, presence: true,
                    length: { maximum: 64 },
                    uniqueness: true
end
