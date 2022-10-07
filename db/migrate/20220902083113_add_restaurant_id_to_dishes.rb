class AddRestaurantIdToDishes < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :restaurant_id, :integer
    add_index :dishes, :restaurant_id
  end
end
