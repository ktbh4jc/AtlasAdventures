# frozen_string_literal: true

class User < ApplicationRecord
  before_save { email.downcase! }
  before_save { username.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_USERNAME_REGEX = /\A[\w]+\Z/i
  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :username,
            presence: true,
            length: { minimum: 4, maximum: 32 },
            format: { with: VALID_USERNAME_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
end
