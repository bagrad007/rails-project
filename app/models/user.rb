class User < ApplicationRecord
  has_many :shows
  has_secure_password

  validates_uniqueness_of :username
  validates_presence_of :username, :password
end
