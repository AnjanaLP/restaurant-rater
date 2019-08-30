require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:anj)
  end

  test "should get new" do
    log_in_as(@user)
    get new_restaurant_path
    assert_response :success
  end

  test "should redirect new unless logged in" do
    get new_restaurant_path
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should redirect create unless logged in" do
    assert_no_difference 'Restaurant.count' do
      post restaurants_path, params: { restaurant: { name: "New Restaurant", category: categories(:one),
                                       address_1: "20", address_2: "New Street", city: "Weybridge",
                                       county: "Surrey" } }
    end
    assert_not flash.empty?
    assert_redirected_to login_path
  end
end
