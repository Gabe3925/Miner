class AddToolIdToUsers < ActiveRecord::Migration
  def change
     add_reference :users, :tool, index: true
  end
end
