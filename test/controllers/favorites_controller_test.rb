require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @restaurant = restaurants(:one)
    @user = users(:one)
  end  
  
  test "should add a favorite to the collection" do
    sign_in users(:one)
    assert_not_includes(@restaurant.favorites, @favorite)    
    @favorite = favorites(:one)
    post addfave_url(@user, @restaurant)
    assert_includes(@restaurant.favorites, @favorite)
    assert_redirected_to restaurant_url(@restaurant)
  end
  
  test "should remove a favorite from the collection" do
    sign_in users(:one)
    @favorite = favorites(:one)
    assert_includes(@restaurant.favorites, @favorite)    
    post removefave_url(@user, @restaurant)
    assert_not_includes(@restaurant.favorites, @favorite)
    assert_redirected_to restaurant_url(@restaurant)
  end
end
