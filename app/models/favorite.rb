class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  
  def get_restaurant
    @id = self.restaurant_id
    @restaurants = Restaurant.where("id = ?", "#{@id}").first
  end
end
