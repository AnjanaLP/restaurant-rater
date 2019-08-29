require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  def setup
    @restaurant = Restaurant.new(name: "Test Restaurant", address_1: "12", address_2: "Baker Street",
                                 city: "London")
  end

  test "validation should accept valid restaurants" do
    assert @restaurant.valid?
  end

  test "name should be present" do
    @restaurant.name = "    "
    assert_not @restaurant.valid?
  end

  test "basic address should be present" do
    @restaurant.address_1 = "    "
    @restaurant.address_2 = "    "
    @restaurant.city = "    "
    assert_not @restaurant.valid?
  end
end
