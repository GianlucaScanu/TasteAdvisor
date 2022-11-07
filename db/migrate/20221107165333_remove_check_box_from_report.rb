class RemoveCheckBoxFromReport < ActiveRecord::Migration[7.0]
  def change
    remove_column :reports, :check_box, :integer
  end
end
