class SkillSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :positions, through: :position_skills
end
