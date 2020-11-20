class ChangeDescriptionToBeTextInBags < ActiveRecord::Migration[6.0]
  def change
    change_column :bags, :description, :text
  end
end
