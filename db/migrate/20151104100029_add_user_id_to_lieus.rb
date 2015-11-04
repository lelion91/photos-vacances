class AddUserIdToLieus < ActiveRecord::Migration
  def change
    add_column :lieus, :user_id, :integer
    add_index :lieus, :user_id
  end
end
