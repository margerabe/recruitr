class CandidateSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :position
end
