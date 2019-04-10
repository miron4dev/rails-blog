class User < ApplicationRecord

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :articles

  before_save {self.email = email.downcase}

  validates :email, presence: true, length: {maximum: 105}, uniqueness: {case_sensitive: false},
            format: {with: VALID_EMAIL_REGEX}

  validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 15}

  has_secure_password
end
