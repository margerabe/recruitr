class PositionSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :candidates
end
