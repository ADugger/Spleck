json.extract! restaurant, :id, :name, :location, :upvotes, :downvotes, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
