class MuppetShow < ApplicationRecord
  belongs_to :muppet
  belongs_to :show

  validates :job, presence: true
end
