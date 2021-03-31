class Show < ApplicationRecord
  belongs_to :user
  has_many :muppet_shows
  has_many :muppets, through: :muppet_shows

  validates :name, presence: true
  validates :date, presence: true
end
