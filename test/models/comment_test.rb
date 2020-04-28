require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @restaurant = restaurants(:two)
    @comment = comments(:two)
  end
  
  test "should get restaurant from collection of comments" do
    @retrieved_restaurant = @comment.get_restaurant
    assert_equal(@restaurant, @retrieved_restaurant)
  end
end
