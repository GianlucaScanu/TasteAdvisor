class RemoveProfilePictureFromRestaurant < ActiveRecord::Migration[7.0]
  def change
    remove_column :restaurants, :profile_picture, :string
  end
end
