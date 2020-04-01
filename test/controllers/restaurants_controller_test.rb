require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { downvotes: @restaurant.downvotes, location: @restaurant.location, name: @restaurant.name, upvotes: @restaurant.upvotes } }
    end

    assert_redirected_to restaurant_url(Restaurant.last)
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should allow edit after login" do
    sign_in users(:one)
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end
  
  test "should redirect edit to sign in" do
    get edit_restaurant_url(@restaurant)
    assert_redirected_to new_user_session_path
  end
  
  test "should redirect update to sign in" do
    patch restaurant_url(@restaurant), params: { restaurant: { downvotes: @restaurant.downvotes, location: @restaurant.location, name: @restaurant.name, upvotes: @restaurant.upvotes } }
    assert_redirected_to new_user_session_path
  end

  test "should redirect destroy to sign in" do
    assert_no_difference('Restaurant.count') do
      delete restaurant_url(@restaurant)
    end    
    assert_redirected_to new_user_session_path
  end
  
  test "should update restaurant after login" do
    sign_in users(:two)
    patch restaurant_url(@restaurant), params: { restaurant: { downvotes: @restaurant.downvotes, location: @restaurant.location, name: @restaurant.name, upvotes: @restaurant.upvotes } }
    assert_redirected_to restaurant_url(@restaurant)
  end

  test "should destroy restaurant after login" do
    sign_in users(:one)
    assert_difference('Restaurant.count', -1) do
      delete restaurant_url(@restaurant)
    end    
    assert_redirected_to restaurants_url
  end
  
  test "should increase upvotes of restaurant after login" do
    sign_in users(:one)
    assert_difference '@restaurant.reload.votes.where(votetype: 1).count' do
      post upvote_url(@restaurant)
      assert_redirected_to restaurant_url(@restaurant)      
    end
  end
  
  test "should increase downvotes of restaurant" do
    sign_in users(:one)
    assert_difference '@restaurant.reload.votes.where(votetype: -1).count' do
      post downvote_url(@restaurant)
      assert_redirected_to restaurant_url(@restaurant)
    end
  end
  
  test "should find restaurant with search" do   
    get restaurants_url, params: { query: 'Florida' }        
    assert_response :success    
    assert_select 'td', 'Florida'
    assert_select 'td', 'California', false
  end
end
