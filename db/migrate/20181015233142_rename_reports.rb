class RenameReports < ActiveRecord::Migration[5.2]
  def change
    rename_table :reports, :messages
  end
end
