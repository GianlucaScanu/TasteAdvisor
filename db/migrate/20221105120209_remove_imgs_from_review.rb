class RemoveImgsFromReview < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :imgs, :string
  end
end
