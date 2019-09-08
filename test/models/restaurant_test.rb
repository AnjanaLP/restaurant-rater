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

  test "city should be present" do
    @restaurant.city = "    "
    assert_not @restaurant.valid?
  end

  test "county should be present" do
    @restaurant.county = "    "
    assert_not @restaurant.valid?
  end
end
