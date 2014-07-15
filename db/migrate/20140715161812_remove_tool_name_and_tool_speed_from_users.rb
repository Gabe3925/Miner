class RemoveToolNameAndToolSpeedFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :tool_name
    remove_column :users, :tool_speed
  end
end
