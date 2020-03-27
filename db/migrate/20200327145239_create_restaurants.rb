class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.int :upvotes
      t.int :downvotes

      t.timestamps
    end
  end
end
