require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  def setup
    @restaurant = Restaurant.new(name: "Test Restaurant", category_id: categories(:one).id,
                                 city: "Weybridge", county: "Surrey")
  end

  test "validation should accept valid restaurants" do
    assert @restaurant.valid?
  end

  test "name should be present" do
    @restaurant.name = "    "
    assert_not @restaurant.valid?
  end

  test "name should be capitalised" do
    lower_case_name = "donastia"
    @restaurant.name = lower_case_name
    @restaurant.save
    assert_equal lower_case_name.capitalize, @restaurant.reload.name
  end

  test "city should be present" do
    @restaurant.city = "    "
    assert_not @restaurant.valid?
  end

  test "city should be capitalised" do
    lower_case_city = "weybridge"
    @restaurant.city = lower_case_city
    @restaurant.save
    assert_equal lower_case_city.capitalize, @restaurant.reload.city
  end

  test "county should be present" do
    @restaurant.county = "    "
    assert_not @restaurant.valid?
  end

  test "county should be capitalised" do
    lower_case_county = "weybridge"
    @restaurant.county = lower_case_county
    @restaurant.save
    assert_equal lower_case_county.capitalize, @restaurant.reload.county
  end

  test "restaurants should be unique" do
    duplicate_restaurant = @restaurant.dup
    duplicate_restaurant.name.downcase!
    duplicate_restaurant.city.downcase!
    duplicate_restaurant.county.downcase!
    duplicate_restaurant.save
    assert_not @restaurant.valid?
  end
end
