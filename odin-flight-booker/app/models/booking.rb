class Booking < ApplicationRecord
  belongs_to :passenger, inverse_of: :booking
  belongs_to :flight

  validates :flight_id, :passenger_id, presence: true

  accepts_nested_attributes_for :passenger
end
