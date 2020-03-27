class Restaurant < ApplicationRecord
  validates :name, :location, presence: true
end
