require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:anj)
    @restaurant = restaurants(:one)
  end

  test "should get new" do
    log_in_as(@user)
    get new_restaurant_review_path(@restaurant)
    assert_response :success
  end

  test "should redirect new unless logged in" do
    get new_restaurant_review_path(@restaurant)
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should redirect create unless logged in" do
    assert_no_difference 'Review.count' do
      post restaurant_reviews_path(@restaurant), params: { content: "Amazing food", rating: 5 }
    end
    assert_not flash.empty?
    assert_redirected_to login_path
  end
end
