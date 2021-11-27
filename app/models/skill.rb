# frozen_string_literal: true

class Skill < ApplicationRecord
  has_many :position_skills, dependent: :destroy
  has_many :positions, through: :position_skills

  validates :name, presence: true, uniqueness: true
end
