class DropFavorites < ActiveRecord::Migration[6.0]
  def change
    drop_table :favorites do |t|
      t.string "favoritable_type", null: false
      t.bigint "favoritable_id", null: false
      t.string "favoritor_type", null: false
      t.bigint "favoritor_id", null: false
      t.string "scope", default: "favorite", null: false
      t.boolean "blocked", default: false, null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
