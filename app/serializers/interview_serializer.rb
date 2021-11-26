class InterviewSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time
  belongs_to :candidate
  belongs_to :recruiter

  def start_time
    object.start_time.strftime("%d/%m/%Y, %H:%M")
  end

  def end_time
    object.end_time.strftime("%d/%m/%Y, %H:%M")
  end
end
