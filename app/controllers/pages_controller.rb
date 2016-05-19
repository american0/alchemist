class PagesController < ApplicationController
  def home
    @offers = Offer.last(12).reverse
  end

  def offers
    @user = current_user
    @offers = Offer.where("user_id = ?", current_user.id)
  end
end
