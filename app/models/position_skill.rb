class PositionSkill < ApplicationRecord
  belongs_to :skill
  belongs_to :position

  validates :position, uniqueness: { scope: :skill }
  # one position cannot have twice marketing as skill
end
