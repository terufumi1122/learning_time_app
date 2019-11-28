class AddUserIdToRecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :records, :user_id, :integer
  end
end
