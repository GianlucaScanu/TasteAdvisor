class RemoveTaRatingFromRestaurants < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurants, :ta_rating, :integer
  end
end
