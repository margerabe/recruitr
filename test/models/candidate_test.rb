# frozen_string_literal: true

require "test_helper"

class CandidateTest < ActiveSupport::TestCase
  def setup
    @position = positions(:one)
    @candidate = candidates(:one)
    @interview = interviews(:one)
  end

  test 'candidate should be valid' do
    assert @candidate.valid?
  end

  test "should not save a candidate without a linked position" do
    candidate = Candidate.new(first_name: "Jean-luc", last_name: "Yves", email: "jly@gmail.com" )
    assert_not candidate.save, "Saved the candidate without a position"
  end

  test "should not save a candidate without an email" do
    candidate = Candidate.new(first_name: "Jean-luc", last_name: "Yves", position: @position )
    assert_not candidate.save, "Saved the candidate without an email"
  end

  test "full_name returns the capitalized first name and last name" do
    candidate = Candidate.new(first_name: "Charles", last_name: "Ponty", email: "jly@gmail.com", position: @position)
    assert_equal "Charles Ponty", candidate.full_name
  end

  test 'dependent destroy - destroying candidate should destroy linked interview' do
    assert_difference('Interview.count', -1) do
      @candidate.destroy
    end
  end
end

