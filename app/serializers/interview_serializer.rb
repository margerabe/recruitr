# frozen_string_literal: true

class InterviewSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :position
  belongs_to :candidate
  belongs_to :recruiter

  def start_time
    object.start_time.strftime('%d/%m/%Y, %H:%M')
  end

  def end_time
    object.end_time.strftime('%d/%m/%Y, %H:%M')
  end

  def position
    object.candidate.position
  end
end
