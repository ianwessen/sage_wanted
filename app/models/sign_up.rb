class SignUp < ActiveRecord::Base

  VALID_EMAIL_REGEX = /.+@.+\..+/i

  validates_presence_of :email
  validates_uniqueness_of :email, :message => "is already registered"
  validates_format_of :email, :with => VALID_EMAIL_REGEX, :message => "format is invalid"

end
