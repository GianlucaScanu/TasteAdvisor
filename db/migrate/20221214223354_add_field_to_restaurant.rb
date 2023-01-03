class AddFieldToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :provider, :string
    add_column :restaurants, :uid, :string
  end
end
