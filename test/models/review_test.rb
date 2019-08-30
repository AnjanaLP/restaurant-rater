require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  def setup
    @user = users(:anj)
    @review = @user.reviews.build(content: "Great food", rating: 5, restaurant: restaurants(:one))
  end

  test "validation should accept valid reviews" do
    assert @review.valid?
  end

  test "content should be present" do
    @review.content = "    "
    assert_not @review.valid?
  end

  test "rating should be present" do
    @review.rating = "    "
    assert_not @review.valid?
  end
end
