class AddDishIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :dish_id, :integer
    add_index :reviews, :dish_id
    add_foreign_key "reviews", "dishes"
  end
end