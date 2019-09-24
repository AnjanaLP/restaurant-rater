require 'test_helper'

class ReviewsCreateTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:anj)
    @restaurant = restaurants(:one)
  end

  test 'unsuccessful review creation' do
    log_in_as(@user)
    get new_restaurant_review_path(@restaurant)
    assert_template 'reviews/new'
    assert_match @restaurant.name, response.body
    assert_no_difference 'Review.count' do
      post restaurant_reviews_path(@restaurant), params: { review: { content: "", rating: 1 } }
    end
    assert_template 'reviews/new'
    assert_select 'div.alert-danger'
  end

  test 'successful review creation' do
    log_in_as(@user)
    get new_restaurant_review_path(@restaurant)
    assert_template 'reviews/new'
    content = "Amazing food!"
    assert_difference 'Review.count', 1 do
      post restaurant_reviews_path(@restaurant), params: { review: { content: content, rating: 5 } }
    end
    assert_redirected_to restaurant_path(@restaurant)
    follow_redirect!
    assert_template 'restaurants/show'
    assert_match content, response.body
    assert_select 'span.star-rating'
    assert_select 'span.timestamp'
    assert_select "a[href=?]", user_path(@user), text: @user.name
    assert_select 'div.pagination'
  end
end
