class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:upvote, :downvote]  
  def upvote
     @user = current_user
     @restaurant = Restaurant.find(params[:id])
     @vote = @restaurant.votes.create(:user => @user, :restaurant => @restaurant, :votetype => 1)
     redirect_to restaurant_path(@restaurant)
  end

  def downvote
     @user = current_user
     @restaurant = Restaurant.find(params[:id])
     @vote = @restaurant.votes.create(:user => @user, :restaurant => @restaurant, :votetype => -1)
     redirect_to restaurant_path(@restaurant)
  end    
end
