class AddTypeRemoveActionToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :type, :string
    remove_column :reports, :action, :string
  end
end
