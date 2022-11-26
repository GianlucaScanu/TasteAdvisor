class AddGMapsRatingToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :gmaps_rating, :float
  end
end
