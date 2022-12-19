class CreateReviewers < ActiveRecord::Migration[7.0]
  def change
    create_table :reviewers do |t|
      t.string :username
      t.string :profile_picture
      t.string :telephone_number
      t.string :description

      t.timestamps
    end
  end
end
