class User < ApplicationRecord
  has_many :shows
  has_many :muppets, through: :shows
end
