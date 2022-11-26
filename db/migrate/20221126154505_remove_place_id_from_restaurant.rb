class RemovePlaceIdFromRestaurant < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurants, :place_id, :string
  end
end
