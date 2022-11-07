class AddCheckBoxesToReport < ActiveRecord::Migration[7.0]
  def change
    add_column :reports, :checkbox1, :boolean
    add_column :reports, :checkbox2, :boolean
    add_column :reports, :checkbox3, :boolean
    add_column :reports, :checkbox4, :boolean
  end
end
