class BookingsController < ApplicationController
  def index
  end

  def new
    @booked_flight_number = params[:flight]
    @passangers_number = params[:passangers_number]
    @booked_flight = Flight.find(@booked_flight_number)
  end

  def create
  end
end
