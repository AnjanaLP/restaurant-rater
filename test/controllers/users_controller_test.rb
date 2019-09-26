require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:anj)
    @other_user = users(:bob)
  end

  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    updated_name = "Updated Name"
    patch user_path(@user), params: { user: { name: updated_name } }
    assert_not flash.empty?
    assert_redirected_to login_url
    assert_not_equal @user.reload.name, updated_name
  end

  test "should redirect edit when logged in as the wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as the wrong user" do
    updated_name = "Updated Name"
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { name: updated_name } }
    assert flash.empty?
    assert_redirected_to root_url
    assert_not_equal @user.reload.name, updated_name
  end

  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@user)
    assert_not @user.admin?
    patch user_path(@user), params: { user: { password: "password", password_confirmation: "password",
                                            admin: true } }
    assert_not @user.reload.admin?
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'User.count' do
      delete user_path(@other_user)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not an admin" do
    log_in_as(@user)
    assert_no_difference 'User.count' do
      delete user_path(@other_user)
    end
    assert_redirected_to root_url
  end
end
