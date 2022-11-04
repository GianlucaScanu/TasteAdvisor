class AddTargetIdToReports < ActiveRecord::Migration[7.0]
  def change
    add_column :reports, :targetId, :integer
  end
end
