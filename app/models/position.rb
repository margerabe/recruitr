class Position < ApplicationRecord
  validates :title, presence: true

  has_many :candidates
  has_many :position_skills, dependent: :destroy
  has_many :skills, through: :position_skills
end
