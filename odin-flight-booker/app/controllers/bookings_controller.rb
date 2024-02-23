class BookingsController < ApplicationController
  before_action :set_passengers_number, :set_booked_flight_number
  def index
  end

  def new
    @booked_flight = Flight.find(@booked_flight_number)
    @booking = Booking.new

    @passengers_number.to_i.times {@booking.passengers.build}
  end

  def create

  end


  private

  def set_passengers_number
    @passengers_number = params[:passengers_number]
  end

  def set_booked_flight_number
    @booked_flight_number = params[:flight]
  end

  def passengers_params
    params.require(:booking).permit(passengers_attributes: [])
  end

end
