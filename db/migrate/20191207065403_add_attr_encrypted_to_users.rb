class AddAttrEncryptedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :encrypted_line_notify_token, :string
    add_column :users, :encrypted_line_notify_token_iv, :string
  end
end
