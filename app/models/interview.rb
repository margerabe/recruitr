# frozen_string_literal: true

class Interview < ApplicationRecord
  belongs_to :candidate
  belongs_to :recruiter

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :candidate, uniqueness: true
  validate :time_checks
  validate :date_checks
  validate :date_taken_recruiter_check

  def time_checks
    errors.add(:start_time, "- Please select a start time later than the current date and time") if self.start_time < Time.now
    errors.add(:end_time, "- Please select an end time later than the start time") if self.start_time >= self.end_time
  end
  
  def date_checks
    errors.add(:end_time, "- The interview must start and end on the same day") if self.start_time.to_date != self.end_time.to_date
    errors.add(:end_time, "- The interview cannot be scheduled on a week-end") if [6, 7].include?(self.start_time.wday) || [6, 7].include?(self.end_time.wday)
    errors.add(:end_time, "- The interview must be scheduled between 10:00 and 18:00") if !(10..18).include?(self.start_time.hour) || !(10..18).include?(self.end_time.hour)
  end

  def date_taken_recruiter_check
    recruiter_interviews = Interview.where(recruiter: self.recruiter)
    if recruiter_interviews.where(":start_time BETWEEN start_time AND end_time", start_time: self.start_time).count > 0 || recruiter_interviews.where(":end_time BETWEEN start_time AND end_time", end_time: self.end_time).count > 0
      errors.add(:start_time, "- Recruiter already scheduled for an interview at that time, please choose another recruiter")
    end
  end
end
