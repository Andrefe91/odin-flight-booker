class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers

  validates :flight_id, :origin, :destination, :duration, presence: true

  #Rejects the elements from the sub-form if any name or email field is empty
  #as an alternative, you can use the symbol :all_blank instead
  accepts_nested_attributes_for :passengers, reject_if: lambda { |attributes|
  attributes['name'].blank? || attributes['email'].blank? }
end
