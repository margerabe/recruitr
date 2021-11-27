# frozen_string_literal: true

class RecruiterSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email
  has_many :interviews
end
