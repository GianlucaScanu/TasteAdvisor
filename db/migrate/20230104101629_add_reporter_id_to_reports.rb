class AddReporterIdToReports < ActiveRecord::Migration[7.0]
  def change
    add_column :reports, :reporterId, :integer
  end
end
