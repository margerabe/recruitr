# frozen_string_literal: true

require "test_helper"

class PositionTest < ActiveSupport::TestCase
  def setup
    @position = Position.new(title: "The first position.")
  end

  test 'position should be valid' do
    assert @position.valid?
  end

  test "should not save a position without a title" do
    position = Position.new
    assert_not position.save, "Saved the position without a title"
  end

  test "association test - should have several candidates" do
    candidate1 = @position.candidates.build(first_name: "Jean-Paul", last_name: "Faucan", email: "jpfaucan@gmail.com")
    candidate1.save
    candidate2 = @position.candidates.build(first_name: "Claude", last_name: "Bourvil", email: "cbourvil@gmail.com")
    candidate2.save
    assert_equal 2, @position.candidates.size
  end
end

