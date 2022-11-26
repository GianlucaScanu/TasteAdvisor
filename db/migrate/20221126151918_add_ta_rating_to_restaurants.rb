class AddTaRatingToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :ta_rating, :float
  end
end
