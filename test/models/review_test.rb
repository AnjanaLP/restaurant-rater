require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  def setup
    @user = users(:anj)
    @review = @user.reviews.build(content: "Great food", rating: 5, restaurant_id: restaurants(:one).id)
  end

  test "validation should accept valid reviews" do
    assert @review.valid?
  end

  test "user id should be present" do
    @review.user_id = nil
    assert_not @review.valid?
  end

  test "content should be present" do
    @review.content = "    "
    assert_not @review.valid?
  end

  test "content should be at most 1000 characters" do
    @review.content = "a" * 1001
    assert_not @review.valid?
  end

  test "rating should be present" do
    @review.rating = "    "
    assert_not @review.valid?
  end

  test "order should be most recent first" do
    assert_equal reviews(:most_recent), Review.first
  end
end
