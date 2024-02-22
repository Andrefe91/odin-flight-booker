class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'

  def flight_text
    "Flight number: #{id}, Duration: #{duration} minutes with date: #{date}"
  end
end
