class RemoveMinesIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :mines_id
  end
end
