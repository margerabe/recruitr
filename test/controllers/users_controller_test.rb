require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success

    json_response = JSON.parse(self.response.body)
    assert_equal @user.email, json_response['email']
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: 'test@test.org', password: '123456' } }, as: :json
    end

    assert_response :created
    end

    test "should not create user with taken email" do
      assert_no_difference('User.count') do
        post users_url, params: { user: { email: @user.email, password: '123456' } }, as: :json
      end

      assert_response :unprocessable_entity
    end

    test "should update user" do
      patch user_url(@user), 
        params: { user: { email: @user.email, password: '123456' } }, 
        headers: { Authorization: JsonWebToken.encode(user_id: @user.id) },
        as: :json
      assert_response :success
    end

    test "should forbid update user" do
      patch user_url(@user), params: { user: { email: @user.email, password: '123456' } }, as: :json
      assert_response :forbidden
    end

    test "should not update user with invalid email" do
      patch user_url(@user), 
        params: { user: { email: 'bad_email', password: '123456' } }, 
        headers: { Authorization: JsonWebToken.encode(user_id: @user.id) },
        as: :json
      assert_response :unprocessable_entity
    end

    test "should destroy user" do
      assert_difference('User.count', -1) do
        delete user_url(@user), 
          headers: { Authorization: JsonWebToken.encode(user_id: @user.id) },
          as: :json
      end

      assert_response :no_content
    end

    test "should forbid destroy user" do
      assert_no_difference('User.count') do
        delete user_url(@user), as: :json
      end

      assert_response :forbidden
    end
end
