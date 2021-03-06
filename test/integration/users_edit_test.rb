require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:anj)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "", email: "invalid",
                                              password: "foo", password_confirmation: "bar"} }
    assert_template 'users/edit'
    assert_select 'div.alert-danger'
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    follow_redirect!
    assert_template 'users/edit'
    name = "Updated"
    email = "updated@example.com"
    patch user_path(@user), params: { user: { name: name, email: email,
                                              password: "", password_confirmation: ""} }
    assert_not flash.empty?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_nil session[:forwarding_url]
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
