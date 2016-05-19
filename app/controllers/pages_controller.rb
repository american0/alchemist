class PagesController < ApplicationController
  def home
    @offers = Offer.last(12).reverse
  end
end
