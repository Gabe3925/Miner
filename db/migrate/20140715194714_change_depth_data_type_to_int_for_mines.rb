class ChangeDepthDataTypeToIntForMines < ActiveRecord::Migration
  def change
    change_column(:mines, :depth, :float, :default => 0.0)
  end
end
