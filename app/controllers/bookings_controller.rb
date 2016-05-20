class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @users = User.all
  end

  def new
    @booking = Booking.new
    @offer = Offer.find(params[:offer_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @offer = Offer.find(params[:offer_id])
    if @booking.guest < 20
      @booking.price = @booking.guest * @offer.base_price
    elsif @booking.guest < 50
      @booking.price = @booking.guest * @offer.price_20
    else
      @booking.price = @booking.guest * @offer.price_50
    end
    @booking.accepted = nil
    @booking.user_id = current_user.id
    @booking.offer_id = @offer.user_id
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    if @booking.save
      redirect_to offer_bookings_path(current_user)
    else
      render :show
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :address, :guest, :accepted)
  end
end
