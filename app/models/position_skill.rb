# frozen_string_literal: true

class PositionSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :position

  validates :position, uniqueness: { scope: :skill, message: '- The position has already been assigned that skill.' }
end
