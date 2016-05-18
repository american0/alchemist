class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @offers = Offer.where("" = params[:id])
  end

end
