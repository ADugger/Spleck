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
  
  def up
    remove_column :restaurants, :upvotes
    remove_column :restaurants, :downvotes
  end
end
