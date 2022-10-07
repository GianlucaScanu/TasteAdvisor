class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating1
      t.integer :rating2
      t.integer :rating3
      t.string :description
      t.string :imgs

      t.timestamps
    end
  end
end
