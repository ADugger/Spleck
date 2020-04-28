class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:add_comment]  
  def add_comment
     @user = current_user
     @restaurant = Restaurant.find(params[:id])
     @msg = params[:msg]
     @comment = @restaurant.comments.create(:user => @user, :restaurant => @restaurant, :body => @msg)
     redirect_to restaurant_path(@restaurant)
  end
end
