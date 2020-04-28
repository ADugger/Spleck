class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:add_favorite, :remove_favorite]  
  def add_favorite
     @user = current_user
     @restaurant = Restaurant.find(params[:id])
     @favorite = @restaurant.favorites.create(:user => @user, :restaurant => @restaurant)
     redirect_to restaurant_path(@restaurant)
  end

  def remove_favorite
     @user = current_user
     @restaurant = Restaurant.find(params[:id])
     @favorite = @restaurant.favorites.where(:user => @user, :restaurant => @restaurant).first
     if @favorite
       @favorite.destroy
     end
     redirect_to restaurant_path(@restaurant)         
  end   
end
