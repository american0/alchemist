class OffersController < ApplicationController
  before_action :set_offer, only: [:edit, :update, :destroy]

  def index
    if  params[:q] == nil
      @offers = Offer.all
    else
      @offers = Offer.near(params[:q], 10)
    end
  end

  def new
    @offer = Offer.new
  end

  def edit
  end

  def update
    @offer.update(offer_params)
    redirect_to offers_path
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

  def destroy
    @offer.destroy
    redirect_to :back
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :city, :base_price, :price_20, :price_50, :photo, :photo_cache)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end

end
