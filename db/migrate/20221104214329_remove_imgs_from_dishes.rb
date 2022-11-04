class RemoveImgsFromDishes < ActiveRecord::Migration[7.0]
  def change
    remove_column :dishes, :imgs, :string
  end
end
