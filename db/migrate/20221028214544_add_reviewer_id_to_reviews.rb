class AddReviewerIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :reviewer_id, :integer
    add_index :reviews, :reviewer_id
    add_foreign_key "reviews", "reviewers"
  end
end