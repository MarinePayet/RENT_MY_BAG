class BookingsController < ApplicationController

  def new
    @user = current_user
    @bag = Bag.find(params[:bag_id])
    @booking = Booking.new
    @bookings = Booking.where(bag_id: @bag.id)
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_date,
        to:   booking.end_date
      }
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.bag = Bag.find(params[:bag_id])
    if @booking.save
      respond_to do |format|
        format.html
        format.js
      end
    else
      render :new
    end
  end

  def index
    @user = current_user
    @bookings = Booking.where(user_id: @user.id)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
