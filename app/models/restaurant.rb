class Restaurant < ApplicationRecord
  has_many :votes
  has_many :users, through: :favorites
  validates :name, :location, presence: true
end
