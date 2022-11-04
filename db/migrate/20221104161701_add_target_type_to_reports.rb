class AddTargetTypeToReports < ActiveRecord::Migration[7.0]
  def change
    add_column :reports, :targetType, :string
  end
end
