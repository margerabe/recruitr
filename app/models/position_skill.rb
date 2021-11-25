class PositionSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :position

  # one position cannot have twice marketing as skill
  validates :position, uniqueness: { scope: :skill }
end
