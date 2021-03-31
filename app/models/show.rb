class Show < ApplicationRecord
  belongs_to :user
  has_many :muppet_shows
  has_many :muppets, through: :muppet_shows

  scope(:organize_date, -> { self.order(date: :desc) })

  validates :name, presence: true
  validates :date, presence: true
end
