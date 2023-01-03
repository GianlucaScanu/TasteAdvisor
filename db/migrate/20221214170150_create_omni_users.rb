class CreateOmniUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :omni_users do |t|

      t.timestamps
    end
  end
end
