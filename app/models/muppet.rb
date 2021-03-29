class Muppet < ApplicationRecord
  has_many :shows
  has_many :users, through: :shows
end
