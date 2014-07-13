class RemoveUserIdFromTools < ActiveRecord::Migration
  def change
    remove_column :tools, :user_id
  end
end
