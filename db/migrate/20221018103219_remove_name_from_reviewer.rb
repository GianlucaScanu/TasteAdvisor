class RemoveNameFromReviewer < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviewers, :name, :string
  end
end
