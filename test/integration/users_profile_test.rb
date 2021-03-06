require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:anj)
    @admin = users(:bob)
  end

  test "profile display of a user including pagination of reviews" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'a', text: 'Delete User', count: 0
    assert_match @user.reviews.count.to_s, response.body
    assert_select 'div.pagination'
    assert_select 'form',false
    assert_select "a[href=?]", new_restaurant_path, count: 0
    @user.reviews.paginate(page: 1).each do |review|
      assert_match review.content, response.body
      assert_select 'span.star-rating'
      assert_select "a[href=?]", restaurant_path(review.restaurant)
      assert_select 'span.timestamp'
    end
    log_in_as(@user)
    get user_path(@user)
    assert_select "form input", 4
    assert_select "a[href=?]", new_restaurant_path
  end

  test "profile display of a user as non admin" do
    log_in_as(@user)
    get user_path(@admin)
    assert_select 'a', text: 'Delete User', count: 0
  end

  test "profile display of a user as an admin" do
    log_in_as(@admin)
    get user_path(@admin)
    assert_select 'a', text: 'Delete User', count: 0
    get user_path(@user)
    assert_select 'h1> a', text: 'Delete User'
    assert_equal Review.count, 34
    assert_difference 'User.count', -1 do
      delete user_path(@user)
    end
    assert_equal Review.count, 0
  end
end
