# frozen_string_literal: true

require 'test_helper'

class InterviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interview = interviews(:one)
  end

  test 'INDEX interview' do
    get interviews_url

    assert_response :success
  end

  # test 'SHOW interview' do
  #   get interview_url(@interview)

  #   assert_response :success
  # end

  # test 'CREATE interview' do
  #   assert_difference('Skill.count') do
  #     post interviews_url, params: { interview: { name: "New interview" } }
  #   end

  #   assert_response :created
  # end

  # test 'UPDATE interview' do
  #   patch interview_url(@interview), params: { interview: { name: "New interview version two" } }
  #   json_response = JSON.parse(response.body)

  #   assert_response :success
  #   assert_equal "New interview version two", json_response["name"]
  # end

  # test 'should not UPDATE interview with blank name' do
  #   patch interview_url(@interview), params: { interview: { name: "" } }

  #   assert_response :unprocessable_entity
  # end

  # test 'DESTROY interview' do
  #   Interview.destroy_all
  #   assert_difference('Skill.count', -1) do
  #     delete interview_url(@interview)
  #   end

  #   assert_response :no_content
  # end
end
