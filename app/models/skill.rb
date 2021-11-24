class Skill < ApplicationRecord

  has_many :positions, through: :position_skills
end
