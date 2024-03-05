class PassengerMailer < ApplicationMailer
  default from: "noreply@airline.com"
  default subject: "Booking confirmed!"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.passenger_mailer.confirmation_email.subject
  #
  def confirmation_email
    @passenger = params[:passenger]
    @booking = params[:booking]

    @url = "http://prueba.com/"

    mail(to: @passenger.email)
  end
end
