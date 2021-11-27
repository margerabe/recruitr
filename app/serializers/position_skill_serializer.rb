class PositionSkillSerializer < ActiveModel::Serializer
  attributes :id, :position, :skill

  def position
    object.position.title
  end

  def skill
    object.skill.name
  end
end
