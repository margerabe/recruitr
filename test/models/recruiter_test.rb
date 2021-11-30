# frozen_string_literal: true

require "test_helper"

class RecruiterTest < ActiveSupport::TestCase
  def setup
    @recruiter = recruiters(:one)
  end

  test 'recruiter should be valid' do
    assert @recruiter.valid?
  end

  test "should not save a recruiter without an email" do
    recruiter = Recruiter.new(first_name: "Jean-luc", last_name: "Yves")
    assert_not recruiter.save, "Saved the recruiter without an email"
  end

  test "full_name returns the capitalized first name and last name" do
    recruiter = Recruiter.new(first_name: "Charles", last_name: "Ponty", email: "jly@gmail.com")
    assert_equal "Charles Ponty", recruiter.full_name
  end
end

