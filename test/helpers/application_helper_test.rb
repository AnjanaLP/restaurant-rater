class ApplicationHelperTest < ActionView::TestCase

  test "full title helper" do
    assert_equal "Restaurant Rater", full_title
    assert_equal "Restaurant Rater | About", full_title("About")
  end
end
