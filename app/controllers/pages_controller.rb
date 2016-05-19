class PagesController < ApplicationController
  def home
    @offers = Offer.last(6).reverse
  end

  def offers
    @user = current_user
    @offers = Offer.where("user_id = ?", current_user.id)
  end
end
