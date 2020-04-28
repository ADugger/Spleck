class Restaurant < ApplicationRecord
  has_many :votes
  has_many :favorites
  has_many :comments
  validates :name, :location, presence: true   
end
