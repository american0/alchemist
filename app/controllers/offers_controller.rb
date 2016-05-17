class OffersController < ApplicationController

  def new
    @offer = Offer.new
    @user = User.find(params[:user_id])
  end

  def create
    @offer = Offern.new(offer_params)
    @user = User.find(params[:user_id])
    @offer.user = @user
    if @offer.save
      redirect_to user_path(@user)
    else
      render 'offers/new'
    end
  end


  def offer_params
    params.require(:offer).permit(:title, :description, :base_rice, :price_20, :price_50)
  end


end
