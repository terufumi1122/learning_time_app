class AddLineNotifyTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :line_notify_token, :string
  end
end
