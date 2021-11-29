# frozen_string_literal: true

require "test_helper"

class PositionTest < ActiveSupport::TestCase

  def setup
    @user = User.new
    @position = Position.new(title: "The first position.", user: @user)
  end

  test 'position should be valid' do
    assert @position.valid?
  end

  test "should not save a position without a title" do
    position = Position.new
    assert_not position.save, "Saved the position without a title"
  end

  test "association test - should have several comments" do
    @position.candidates.build(first_name: "Jean-Paul", last_name: "Faucan", email: "jpfaucan@gmail.com")
    @position.candidates.build(first_name: "Claude", last_name: "Bourvil", email: "cbourvil@gmail.com")
    assert_equal 2, @position.candidates.size
  end
end

