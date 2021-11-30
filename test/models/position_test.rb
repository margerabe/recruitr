# frozen_string_literal: true

require "test_helper"

class PositionTest < ActiveSupport::TestCase
  def setup
    @position = positions(:one)
    @candidate1 = candidates(:one)
    @candidate2 = candidates(:two)
  end

  test 'position should be valid' do
    assert @position.valid?
  end

  test "should not save a position without a title" do
    position = Position.new
    assert_not position.save, "Saved the position without a title"
  end

  test "association - position should have several candidates" do
    assert_equal 2, @position.candidates.size
  end

  test 'dependent destroy - destroying position should destroy linked candidate' do
    assert_difference('Candidate.count', -2) do
      @position.destroy
    end
  end
end

