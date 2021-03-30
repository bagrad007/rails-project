class Muppet < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :muppet_shows
  has_many :shows, through: :muppet_shows
  has_many :users, through: :shows

  accepts_nested_attributes_for :muppet_shows
end
