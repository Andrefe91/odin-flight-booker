class FlightsController < ApplicationController
  def index
    @airports_options = Airport.all.map {|airport| [airport.name_code, airport.id]}
    @flight_dates = Flight.all.map {|flight| [flight.date, flight.id]}.sort.uniq(&:first)

    @selected_departure_airport_id = params[:departure_airport_id]
    @selected_arrival_airport_id = params[:arrival_airport_id]
    @selected_passangers_number = params[:passangers_number]
    @selected_date = params[:flight_id]
  end
end
