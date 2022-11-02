class AddIngredientsToDish < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :ingredients, :string
  end
end
