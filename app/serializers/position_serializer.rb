class PositionSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :candidates
  has_many :skills, through: :position_skills
end
