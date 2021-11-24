class Position < ApplicationRecord
  validates :title, presence: true

  has_many :candidates
  has_many :skills, through: :position_skills
end
