class RemoveLineNotifyTokenFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :line_notify_token, :string
  end
end
