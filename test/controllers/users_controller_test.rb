require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  include AuthHelper

  def setup
    @user = User.where(:username => 'user').first

    sign_in_as_user
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should create user" do
    logout

    assert_difference('User.count') do
      post users_url, params: {user: {email: 'someemail@example.com', username: 'VeryCool', password: 'verySecurePassword'}}
    end

    assert_redirected_to root_path
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should get edit, because user is admin" do
    sign_in_as_admin

    get edit_user_url(@user)
    assert_response :success
  end

  test "should not get edit, because anonymous" do
    logout

    get edit_user_url(@user)

    assert_not_empty(flash[:alert])
    assert_redirected_to login_path
  end

  test "should not get edit, because users are not equals" do
    sign_in_as_user2

    get edit_user_url(@user)

    assert_not_empty(flash[:alert])
    assert_redirected_to user_url(@user)
  end

  test "should update user" do
    patch user_url(@user), params: {user: {email: 'someemail@example.com', username: 'VeryCool', password: 'verySecurePassword'}}
    assert_redirected_to user_url(@user)
  end

  test "should update user, because user is admin" do
    sign_in_as_admin

    patch user_url(@user), params: {user: {email: 'someemail@example.com', username: 'VeryCool', password: 'verySecurePassword'}}
    assert_redirected_to user_url(@user)
  end

  test "should not update user, because anonymous" do
    logout

    patch user_url(@user), params: {user: {email: 'someemail@example.com', username: 'VeryCool', password: 'verySecurePassword'}}

    assert_not_empty(flash[:alert])
    assert_redirected_to login_path
  end

  test "should not update user, because users are not equals" do
    sign_in_as_user2

    patch user_url(@user), params: {user: {email: 'someemail@example.com', username: 'VeryCool', password: 'verySecurePassword'}}

    assert_not_empty(flash[:alert])
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to root_path
  end

  test "should destroy user, because user is admin" do
    sign_in_as_admin

    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to root_path
  end

  test "should not destroy user, because anonymous" do
    logout

    assert_no_difference('User.count') do
      delete user_url(@user)
    end

    assert_not_empty(flash[:alert])
    assert_redirected_to login_path
  end

  test "should not destroy user, because users are not equals" do
    sign_in_as_user2

    assert_no_difference('User.count') do
      delete user_url(@user)
    end


    assert_not_empty(flash[:alert])
    assert_redirected_to user_url(@user)
  end
end
