class OffersController < ApplicationController

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    if @offer.save
      redirect_to user_path(current_user)
    else
      render 'offers/new'
    end
  end


  def offer_params
    params.require(:offer).permit(:title, :description, :city, :base_price, :price_20, :price_50)
  end


end
