class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :username
      t.string :website
      t.string :description
      t.string :profile_picture
      t.string :mail
      t.string :password
      t.string :telephone_number
      t.string :address

      t.timestamps
    end
  end
end
