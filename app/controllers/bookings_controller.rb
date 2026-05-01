class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])

    if @flight.departure_datetime < Date.current
      redirect_to flights_path, alert: "This flight has already departed and cannot be booked."
    else
      @booking = Booking.new
    end
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking, notice: "Booking was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.expect(
      booking: [
        :flight_id,
        :total_paid,
        :status,
        passengers_attributes: [
          :id,
          :name,
          :date_of_birth,
          :_destroy
        ]
      ]
    )
  end
end
