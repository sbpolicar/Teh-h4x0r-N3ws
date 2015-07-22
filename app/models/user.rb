class User < ActiveRecord::Base

  has_secure_password

  #minimal email validation
  #because I agree with this: http://davidcel.is/posts/stop-validating-email-addresses-with-regex/
  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false},
  format: {with: /@/}

  validates :password,
  presence: true,
  on: [:create]

  has_many :posts
end
