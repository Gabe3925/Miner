class SetDefaultToolIdForUsers < ActiveRecord::Migration
  def change
    change_column_default(:users, :tool_id, 1)
  end
end
