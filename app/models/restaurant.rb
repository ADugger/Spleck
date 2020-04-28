class Restaurant < ApplicationRecord
  has_many :votes
  has_many :favorites
  validates :name, :location, presence: true
end
