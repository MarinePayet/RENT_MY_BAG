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
    @bag = Bag.find(params[:bag_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.bag = @bag
    if @booking.save
      respond_to do |format|
        format.html
        format.js
      end
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path
  end

   private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
