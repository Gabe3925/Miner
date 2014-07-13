class AddToolToUser < ActiveRecord::Migration
  def change
    add_column :users, :tool_name, :string, :default => "Pick Axe"
    add_column :users, :tool_speed, :integer, :default => 1
  end
end
