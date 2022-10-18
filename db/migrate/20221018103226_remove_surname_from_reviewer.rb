class RemoveSurnameFromReviewer < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviewers, :surname, :string
  end
end
