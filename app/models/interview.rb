class Interview < ApplicationRecord
  belongs_to :candidate
  belongs_to :recruiter

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :start_check
  validate :start_end_check
  validate :date_taken_candidate_check
  validate :date_taken_recruiter_check

  def start_check
    errors.add(:start_time, "- Please select a start time later than the current date and time") if self.start_time < Time.now
  end

  def start_end_check
    errors.add(:end_time, "- Please select an end time later than the start time") if self.start_time >= self.end_time
  end

  def date_taken_candidate_check
    candidate_interviews = Interview.where(candidate: self.candidate)
    if candidate_interviews.where(":start_time BETWEEN start_time AND end_time", start_time: self.start_time).count > 0 || candidate_interviews.where(":end_time BETWEEN start_time AND end_time", end_time: self.end_time).count > 0
      errors.add(:start_time, "- Candidate already scheduled for an interview at that time")
    end
  end

  def date_taken_recruiter_check
    recruiter_interviews = Interview.where(recruiter: self.recruiter)
    if recruiter_interviews.where(":start_time BETWEEN start_time AND end_time", start_time: self.start_time).count > 0 || recruiter_interviews.where(":end_time BETWEEN start_time AND end_time", end_time: self.end_time).count > 0
      errors.add(:start_time, "- Recruiter already scheduled for an interview at that time")
    end
  end
end
