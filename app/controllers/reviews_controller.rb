class ReviewsController < ApplicationController
  before_action :find_booking


  private

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end
end
