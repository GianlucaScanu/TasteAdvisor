class RemoveMailFromReviewer < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviewers, :mail, :string
  end
end
