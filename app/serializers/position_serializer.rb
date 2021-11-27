# frozen_string_literal: true

class PositionSerializer < ActiveModel::Serializer
  attributes :id, :title, :skills
  has_many :candidates

  def skills
    object.skills.pluck(:name)
  end
end
