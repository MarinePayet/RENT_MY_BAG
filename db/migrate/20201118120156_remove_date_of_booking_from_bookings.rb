class RemoveDateOfBookingFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :date_of_booking, :string
  end
end
