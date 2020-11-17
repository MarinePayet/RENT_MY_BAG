class RenameTypeToStyle < ActiveRecord::Migration[6.0]
  def change
    rename_column :bags, :type, :style
  end
end
