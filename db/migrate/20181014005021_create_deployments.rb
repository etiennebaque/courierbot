class CreateDeployments < ActiveRecord::Migration[5.2]
  def change
    create_table :deployments do |t|
      t.string :city
      t.string :country
      t.string :cause

      t.timestamps
    end
  end
end
