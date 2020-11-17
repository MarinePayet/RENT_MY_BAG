class CreateBags < ActiveRecord::Migration[6.0]
  def change
    create_table :bags do |t|
      t.string :title
      t.string :description
      t.string :brand
      t.integer :price
      t.string :type
      t.string :mood
      t.string :color
      t.boolean :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
