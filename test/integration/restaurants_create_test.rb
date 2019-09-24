require 'test_helper'

class RestaurantsCreateTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:anj)
  end

  test 'unsuccessful restaurant creation' do
    log_in_as(@user)
    get new_restaurant_path
    assert_template 'restaurants/new'
    assert_no_difference 'Restaurant.count' do
      post restaurants_path, params: { restaurant: { name: "", city: "Weybridge", county: "Surrey",
                                                     category_id: categories(:one).id } }
    end
    assert_template 'restaurants/new'
    assert_select 'div.alert-danger'
  end

  test 'successful restaurant creation' do
    log_in_as(@user)
    get new_restaurant_path
    assert_template 'restaurants/new'
    assert_difference 'Restaurant.count', 1 do
      post restaurants_path, params: { restaurant: { name: "Test Restaurant", city: "Weybridge",
                                                     county: "Surrey", category_id: categories(:one).id } }
    end
    follow_redirect!
    assert_template 'restaurants/show'
  end
end
