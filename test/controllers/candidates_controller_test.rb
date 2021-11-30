# frozen_string_literal: true

require 'test_helper'

class CandidatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @candidate = candidates(:one)
  end

  test 'INDEX candidate' do
    get candidates_url

    assert_response :success
  end

  test 'SHOW candidate' do
    get candidate_url(@candidate)

    assert_response :success
  end

  test 'CREATE candidate' do
    assert_difference('Candidate.count') do
      post candidates_url, params: { candidate:
                                      {
                                        first_name: 'François',
                                        last_name: 'Dupont',
                                        email: 'fdupont@gmail.com',
                                        position_id: @candidate.position.id
                                      } }
    end

    assert_response :created
  end

  test 'cannot CREATE candidate with existing email' do
    post candidates_url, params: { candidate:
                                    {
                                      first_name: 'François',
                                      last_name: 'Dupont',
                                      email: @candidate.email,
                                      position_id: @candidate.position.id
                                    } }

    assert_response :unprocessable_entity
  end

  test 'UPDATE candidate' do
    patch candidate_url(@candidate), params: { candidate: { first_name: 'Bertrand' } }
    json_response = JSON.parse(response.body)

    assert_response :success
    assert_equal 'Bertrand', json_response['first_name']
  end

  test 'should not UPDATE candidate with blank email' do
    patch candidate_url(@candidate), params: { candidate: { email: '' } }

    assert_response :unprocessable_entity
  end

  test 'DESTROY candidate' do
    assert_difference('Candidate.count', -1) do
      delete candidate_url(@candidate)
    end

    assert_response :no_content
  end
end
