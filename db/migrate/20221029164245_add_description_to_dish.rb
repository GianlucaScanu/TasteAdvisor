class AddDescriptionToDish < ActiveRecord::Migration[7.0]
  def change
    add_column :dishes, :description, :string
  end
end
