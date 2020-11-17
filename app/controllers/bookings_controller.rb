class BookingsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @bag = Bag.find(params[:bag_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = User.find(params[:user_id])
    @booking.bag = Bag.find(params[:bag_id])
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_of_booking)
  end
end
