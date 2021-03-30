class Show < ApplicationRecord
  belongs_to :user
  has_many :muppet_shows
  has_many :muppets, through: :muppet_show
end
