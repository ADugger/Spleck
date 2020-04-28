require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @restaurant = restaurants(:one)
    @user = users(:one)
  end  
  
  test "should add a comment to the collection" do
    sign_in users(:one)
    assert_not_includes(@restaurant.comments, @comment)    
    @comment = comments(:one)
    post comment_url(@user, @restaurant)
    assert_includes(@restaurant.comments, @comment)
    assert_redirected_to restaurant_url(@restaurant)
  end  
end
