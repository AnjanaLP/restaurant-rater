require 'test_helper'

class RestaurantsProfileTest < ActionDispatch::IntegrationTest

  def setup
    @restaurant = restaurants(:one)
  end

  test "profile display" do
    get restaurant_path(@restaurant)
    assert_template 'restaurants/show'
    assert_select 'title', full_title(@restaurant.name)
    assert_match @restaurant.name, response.body
    assert_match @restaurant.description, response.body
    assert_match @restaurant.category.name, response.body
    assert_match @restaurant.address_1, response.body
    assert_match @restaurant.address_2, response.body
    assert_match @restaurant.city, response.body
    assert_match @restaurant.county, response.body
    assert_match @restaurant.phone, response.body
    assert_match @restaurant.email, @restaurant.phone, response.body
    assert_match @restaurant.reviews.count.to_s, response.body
    assert_select "a[href=?]", new_restaurant_review_path(@restaurant)
    assert_select 'div.pagination'
    @restaurant.reviews.paginate(page: 1).each do |review|
      assert_match review.content, response.body
      assert_match "*" * review.rating, response.body
      assert_match review.created_at.strftime("%d/%m/%Y"), response.body
      assert_select "a[href=?]", user_path(review.user), text: review.user.name
    end
  end
end