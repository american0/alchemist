class Booking < ActiveRecord::Base
  belongs_to :offer
  belongs_to :user

  has_one :review

  validates :date, presence: true
  validates :address, presence: true
end
