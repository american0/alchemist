class Offer < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  has_many :ratings, through: :bookings

  validates :title, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :base_price, presence: true
  validates :price_20, presence: true
  validates :price_50, presence: true
end
