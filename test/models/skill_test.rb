# frozen_string_literal: true

require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  def setup
    @skill = skills(:one)
  end

  test 'skill should be valid' do
    assert @skill.valid?
  end

  test 'should not save a skill without a name' do
    skill = Skill.new
    assert_not skill.save, 'Saved the skill without a name'
  end
end
