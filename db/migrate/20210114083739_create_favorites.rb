class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bag, null:false, foreign_key: true
      t.boolean :liked
      t.timestamps
    end
  end
end

