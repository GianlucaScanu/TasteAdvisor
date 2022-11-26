class RemoveGMapsRatingFromRestaurants < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurants, :gmaps_rating, :float
  end
end
