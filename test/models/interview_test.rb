# frozen_string_literal: true

require "test_helper"

class InterviewTest < ActiveSupport::TestCase
  def setup
    @interview = interviews(:one)
  end

  test 'interview should be valid' do
    new_interview = Interview.new(
      start_time: DateTime.new(2022,10,13,10,0,0),
      end_time: DateTime.new(2022,10,13,11,0,0),
      candidate: candidates(:two),
      recruiter: recruiters(:two)
    )
    assert new_interview.valid?
  end

  test 'interview should start and end on the same day' do
    new_interview = Interview.new(
      start_time: DateTime.new(2022,10,13,10,0,0),
      end_time: DateTime.new(2022,10,14,11,0,0),
      candidate: candidates(:two),
      recruiter: recruiters(:two)
    )
    assert_not new_interview.valid?
  end

  test 'interview should be scheduled between 10:00 and 18:00' do
    new_interview = Interview.new(
      start_time: DateTime.new(2022,10,13,9,0,0),
      end_time: DateTime.new(2022,10,13,10,0,0),
      candidate: candidates(:two),
      recruiter: recruiters(:two)
    )
    assert_not new_interview.valid?
  end
end

