require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get new_restaurant_path
    assert_response :success
  end
end
