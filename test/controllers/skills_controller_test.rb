# frozen_string_literal: true

require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @skill = skills(:one)
  end

  test 'INDEX skill' do
    get skills_url

    assert_response :success
  end

  test 'SHOW skill' do
    get skill_url(@skill)

    assert_response :success
  end

  test 'CREATE skill' do
    assert_difference('Skill.count') do
      post skills_url, params: { skill: { name: "New skill" } }
    end

    assert_response :created
  end

  test 'UPDATE skill' do
    patch skill_url(@skill), params: { skill: { name: "New skill version two" } }
    json_response = JSON.parse(response.body)

    assert_response :success
    assert_equal "New skill version two", json_response["name"]
  end

  test 'should not UPDATE skill with blank name' do
    patch skill_url(@skill), params: { skill: { name: "" } }

    assert_response :unprocessable_entity
  end

  test 'DESTROY skill' do
    assert_difference('Skill.count', -1) do
      delete skill_url(@skill)
    end

    assert_response :no_content
  end
end
