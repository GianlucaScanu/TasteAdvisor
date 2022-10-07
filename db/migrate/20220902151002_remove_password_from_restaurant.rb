class RemovePasswordFromRestaurant < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurants, :password, :string
  end
end
