# frozen_string_literal: true

require 'test_helper'

class RecruitersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recruiter = recruiters(:one)
    @recruiter2 = recruiters(:two)
  end

  test 'INDEX recruiter' do
    get recruiters_url

    assert_response :success
  end

  test 'SHOW recruiter' do
    get recruiter_url(@recruiter)

    assert_response :success
  end

  test 'CREATE recruiter' do
    assert_difference('Recruiter.count') do
      post recruiters_url, params: { recruiter:
                                      {
                                        first_name: 'François',
                                        last_name: 'Dupont',
                                        email: 'fdupont@gmail.com'
                                      } }
    end

    assert_response :created
  end

  test 'cannot CREATE recruiter with existing email' do
    post recruiters_url, params: { recruiter:
                                    {
                                      first_name: 'François',
                                      last_name: 'Dupont',
                                      email: @recruiter.email
                                    } }

    assert_response :unprocessable_entity
  end

  test 'UPDATE recruiter' do
    patch recruiter_url(@recruiter), params: { recruiter: { first_name: 'Bertrand' } }
    json_response = JSON.parse(response.body)

    assert_response :success
    assert_equal 'Bertrand', json_response['first_name']
  end

  test 'should not UPDATE recruiter with blank email' do
    patch recruiter_url(@recruiter), params: { recruiter: { email: '' } }

    assert_response :unprocessable_entity
  end

  test 'DESTROY recruiter' do
    assert_difference('Recruiter.count', -1) do
      delete recruiter_url(@recruiter2)
    end

    assert_response :no_content
  end
end
