require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:anj)
    @restaurant = restaurants(:one)
  end

  test "should get new" do
    log_in_as(@user)
    get new_restaurant_path
    assert_response :success
  end

  test "should redirect new unless logged in" do
    get new_restaurant_path
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect create unless logged in" do
    assert_no_difference 'Restaurant.count' do
      post restaurants_path, params: { restaurant: { name: "New Restaurant", category: categories(:one),
                                       address_1: "20", address_2: "New Street", city: "Weybridge",
                                       county: "Surrey" } }
    end
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when not logged in" do
    get edit_restaurant_path(@restaurant)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when not an admin" do
    log_in_as(@user)
    get edit_restaurant_path(@restaurant)
    assert_redirected_to root_url
  end

  test "should redirect update when not logged in" do
    updated_name = "Updated Name"
    patch restaurant_path(@restaurant), params: { restaurant: { name: updated_name } }
    assert_not flash.empty?
    assert_redirected_to login_url
    assert_not_equal @restaurant.reload.name, updated_name
  end

  test "should redirect update when not an admin" do
    updated_name = "Updated Name"
    log_in_as(@user)
    patch restaurant_path(@restaurant), params: { restaurant: { name: updated_name } }
    assert_redirected_to root_url
    assert_not_equal @restaurant.reload.name, updated_name
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Restaurant.count' do
      delete restaurant_path(@restaurant)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not an admin" do
    log_in_as(@user)
    assert_no_difference 'Restaurant.count' do
      delete restaurant_path(@restaurant)
    end
    assert_redirected_to root_url
  end
end
