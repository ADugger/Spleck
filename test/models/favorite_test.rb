require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  setup do
    @restaurant = restaurants(:two)
    @favorite = favorites(:two)
  end
  
  test "should get restaurant from the favorite collection" do
    @retrieved_restaurant = @favorite.get_restaurant
    assert_equal(@restaurant, @retrieved_restaurant)
  end
end
