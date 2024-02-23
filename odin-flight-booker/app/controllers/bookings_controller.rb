class BookingsController < ApplicationController
  def index
  end

  def new
    @booked_flight_number = params[:flight]
    @passengers_number = params[:passengers_number]
    @booked_flight = Flight.find(@booked_flight_number)

    @booking = Booking.build()

    @passengers = []
    @passengers_number.to_i.times { @passengers << Passenger.build()}

  end

  def create

  end
end
