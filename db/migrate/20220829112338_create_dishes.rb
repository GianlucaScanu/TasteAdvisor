class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :number_of_reviews
      t.float :price
      t.integer :category
      t.float :avg_rating
      t.string :imgs

      t.timestamps
    end
  end
end
