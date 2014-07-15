class SetDefaultDollarsForUsers < ActiveRecord::Migration
  def change
    change_column_default(:users, :dollars, 0)
  end
end
