class FlightsController < ApplicationController
  def index
    @airports_options = Airport.all.map {|airport| [airport.name_code, airport.id]}
    @flight_dates = Flight.all.map {|flight| [flight.date, flight.date]}.sort.uniq(&:first)

    @selected_departure_airport_id = params[:departure_airport_id]
    @selected_arrival_airport_id = params[:arrival_airport_id]
    @selected_passengers_number = params[:passengers_number]
    @selected_date = params[:date]

    @flight_options_sql = Flight.where("departure_airport_id = ? AND arrival_airport_id = ? AND date > ?",
    params[:departure_airport_id], params[:arrival_airport_id], params[:date]).order(:date)

  end

  def new
    @flight = Flight.new()
  end
end
