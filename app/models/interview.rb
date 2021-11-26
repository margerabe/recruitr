class Interview < ApplicationRecord
  belongs_to :candidate
  belongs_to :recruiter

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :start_check
  validate :start_end_check

  def start_check
    errors.add(:start_time, "- Please select a start time later than the current date and time") if self.start_time < Time.now
  end

  def start_end_check
    errors.add(:end_time, "- Please select an end time later than the start time") if self.start_time >= self.end_time
  end
end
