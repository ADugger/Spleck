class Restaurant < ApplicationRecord
  has_many :votes
  validates :name, :location, presence: true
end
