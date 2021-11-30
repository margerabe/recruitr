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

  test 'SHOW interview' do
    get interview_url(@interview)

    assert_response :success
  end

  test 'UPDATE interview' do
    patch interview_url(@interview), params: { interview: { 
                                                  start_time: DateTime.new(2022,10,13,16,0,0),
                                                  end_time: DateTime.new(2022,10,13,17,0,0)
                                                } 
                                              }
    json_response = JSON.parse(response.body)

    assert_equal DateTime.new(2022,10,13,17,0,0), json_response["end_time"]
  end

  test 'should not UPDATE interview with blank start date' do
    patch interview_url(@interview), params: { interview: { start_date: "" } }

    assert_response :unprocessable_entity
  end

  test 'DESTROY interview' do
    assert_difference('Interview.count', -1) do
      delete interview_url(@interview)
    end

    assert_response :no_content
  end
end
