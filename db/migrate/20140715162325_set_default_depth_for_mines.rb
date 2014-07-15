class SetDefaultDepthForMines < ActiveRecord::Migration
  def change
    change_column_default(:mines, :depth, 0)
  end
end
