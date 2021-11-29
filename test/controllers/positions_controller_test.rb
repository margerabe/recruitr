# frozen_string_literal: true

require 'test_helper'

class PositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @position = positions(:one)
  end

  test 'get index' do
    get positions_url
    assert_response :success
  end

  test 'create position' do
    assert_difference('Position.count') do
      post positions_url, params: { position: { title: @position.title } }
    end

    assert_response :created
  end
end
