class Muppet < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :date, presence: true
  has_many :shows
  has_many :users, through: :shows

  accepts_nested_attributes_for :shows
end
