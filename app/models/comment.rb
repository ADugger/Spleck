class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :body, presence: true
  
  def get_restaurant
    @id = self.restaurant_id
    @restaurants = Restaurant.where("id = ?", "#{@id}").first
  end
end
