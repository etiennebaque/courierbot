class AddReceivedAtToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :received_at, :datetime
  end
end
