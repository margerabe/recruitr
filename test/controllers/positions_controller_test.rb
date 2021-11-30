# frozen_string_literal: true

require 'test_helper'

class PositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @position = positions(:one)
  end

  test 'INDEX position' do
    get positions_url

    assert_response :success
  end

  test 'SHOW position' do
    get position_url(@position)

    assert_response :success
  end

  test 'CREATE position' do
    assert_difference('Position.count') do
      post positions_url, params: { position: { title: @position.title } }
    end

    assert_response :created
  end

  test 'CREATE position with skills' do
    assert_difference('Position.count') do
      post positions_url, params: { position: 
                                      { 
                                        title: @position.title, 
                                        skill_ids: [skills(:three).id, skills(:four).id]
                                      } 
                                  }
    end
    json_response = JSON.parse(response.body)
    
    assert_response :created
    assert_equal 2, json_response["skills"].length
  end

  test 'UPDATE position' do
    patch position_url(@position), params: { position: { title: "New position" } }
    json_response = JSON.parse(response.body)

    assert_response :success
    assert_equal "New position", json_response["title"]
  end

  test 'should not UPDATE position with blank title' do
    patch position_url(@position), params: { position: { title: "" } }

    assert_response :unprocessable_entity
  end

  test 'DESTROY position' do
    Interview.destroy_all
    assert_difference('Position.count', -1) do
      delete position_url(@position)
    end

    assert_response :no_content
  end
end
