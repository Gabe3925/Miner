class ChangeDefaultToolForUsers < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, :default => 'None'
  end
end
