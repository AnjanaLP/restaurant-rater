require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test 'unsuccessful sign up' do
    get signup_path
    assert_template 'users/new'
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "", email: "invalid", password: "invalid",
                                password_confirmation: "password"} }
    end
    assert_template 'users/new'
    assert_select 'div.alert-danger'
  end

  test 'successful sign up' do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "Test User", email: "test_user@example.com",
                                        password: "password", password_confirmation: "password"} }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
    assert is_logged_in?
  end
end
