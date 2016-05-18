class PagesController < ApplicationController
  def home
    @offers = Offer.last(6).reverse
  end
end
