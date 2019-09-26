require 'test_helper'

class RestaurantsEditTest < ActionDispatch::IntegrationTest
  def setup
    @restaurant = restaurants(:one)
    @admin = users(:bob)
  end

  test "unsuccessful edit" do
    log_in_as(@admin)
    get edit_restaurant_path(@restaurant)
    assert_template 'restaurants/edit'
    patch restaurant_path(@restaurant), params: { restaurant: { name: "" } }
    assert_template 'restaurants/edit'
    assert_select 'div.alert-danger'
  end

  test "successful edit" do
    log_in_as(@admin)
    get edit_restaurant_path(@restaurant)
    assert_template 'restaurants/edit'
    updated_name = "Updated Name"
    updated_city = "Updated City"
    patch restaurant_path(@restaurant), params: { restaurant: { name: updated_name, city: updated_city } }
    assert_not flash.empty?
    assert_redirected_to @restaurant
    follow_redirect!
    assert_template 'restaurants/show'
    @restaurant.reload
    assert_equal updated_name, @restaurant.name
    assert_equal updated_city, @restaurant.city
  end
end
