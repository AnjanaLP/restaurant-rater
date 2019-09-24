require 'test_helper'

class RestaurantsSearchTest < ActionDispatch::IntegrationTest

  test 'restaurants search results' do
    get search_restaurants_path, params: { category: categories(:two).id, location: "London" }
    assert_template 'restaurants/search'
    assert_select 'title', full_title("Search results")
    assert_select 'h3', text: "2 restaurants match your search criteria ...."
    assert_select "a[href=?]", restaurant_path(restaurants(:one))
    assert_select "a[href=?]", restaurant_path(restaurants(:four))
    assert_select "a[href=?]", restaurant_path(restaurants(:two)), count: 0
    assert_select "a[href=?]", restaurant_path(restaurants(:three)), count: 0
    assert_select "a[href=?]", new_restaurant_path
  end
end
