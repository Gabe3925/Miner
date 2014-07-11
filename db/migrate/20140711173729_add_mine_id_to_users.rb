class AddMineIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :mines, index: true
  end
end
