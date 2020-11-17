class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :date_of_booking
      t.references :user, null: false, foreign_key: true
      t.references :bag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
