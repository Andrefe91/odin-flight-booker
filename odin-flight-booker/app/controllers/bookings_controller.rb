class BookingsController < ApplicationController
  before_action :set_passengers_number, :set_booked_flight_number
  def index
  end

  def show
    @booking = Booking.find(params[:id])
    @passengers = @booking.passengers
    @flight = Flight.find(@booking.flight_id)

    respond_to do |format|
      format.html { render :show }
      format.json { render :json => @flight }
    end
  end

  def new
    @booked_flight = Flight.find(@booked_flight_number)
    @booking = Booking.new

    @passengers_number.to_i.times {@booking.passengers.build}
  end

  def create
    @booking = Booking.new(passengers_params)
    @booking.origin = Airport.find()

    if @booking.save
      redirect_to booking_path(@booking)
    else
      flash.now[:notice] = "Error creating booking"
    end
  end


  private

  def set_passengers_number
    @passengers_number = params[:passengers_number]
  end

  def set_booked_flight_number
    @booked_flight_number = params[:flight]
  end

  def passengers_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end

  def booking_permited_params
    params.require(:params).permit(:id)
  end

end
