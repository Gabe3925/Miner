class AddUserIdToTools < ActiveRecord::Migration
  def change
     add_column :tools, :user_id, :integer, references: :users
  end
end
