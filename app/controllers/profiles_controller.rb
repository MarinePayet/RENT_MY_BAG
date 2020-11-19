class ProfilesController < ApplicationController
  def me
    @bags = current_user.bags
    @bookings = current_user.bookings
  end
end
