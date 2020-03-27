class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.integer :upvotes
      t.integer :downvotes

      t.timestamps
    end
  end
end
