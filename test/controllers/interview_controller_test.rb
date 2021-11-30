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

  test 'CREATE interview' do
    new_start_time = DateTime.new(2022, 0o5, 13, 16, 0, 0)

    assert_difference('Interview.count') do
      post interviews_url, params: {
        interview: {
          start_time: new_start_time,
          end_time: new_start_time + 1.hour,
          candidate_id: candidates(:two).id,
          recruiter_id: recruiters(:two).id
        }
      }
    end

    assert :success
  end

  test 'EMAIL after interview creation' do
    new_start_time = DateTime.new(2022, 0o5, 13, 16, 0, 0)

    assert_emails(1) do
      post interviews_url, params: {
        interview: {
          start_time: new_start_time,
          end_time: new_start_time + 1.hour,
          candidate_id: candidates(:two).id,
          recruiter_id: recruiters(:two).id
        }
      }
    end

    assert :success
  end

  test 'UPDATE interview' do
    new_start_time = DateTime.new(2022, 10, 13, 16, 0, 0)
    patch interview_url(@interview), params: { interview: {
      start_time: new_start_time,
      end_time: new_start_time + 1.hour
    } }
    json_response = JSON.parse(response.body)

    assert_equal new_start_time, json_response['start_time']
  end

  test 'should not UPDATE interview with blank start date' do
    patch interview_url(@interview), params: { interview: { start_date: '' } }

    assert_response :unprocessable_entity
  end

  test 'DESTROY interview' do
    assert_difference('Interview.count', -1) do
      delete interview_url(@interview)
    end

    assert_response :no_content
  end
end
