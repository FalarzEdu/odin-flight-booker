class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end
  def new
    @flight = Flight.find(params[:flight_id])

    if @flight.departure_datetime < Time.current
      redirect_to flights_path, alert: "This flight has already departed and cannot be booked."
    else
      @booking = @flight.bookings.build
      requested_passengers_count = params[:passengers_count].to_i ||= nil
      @passengers_count = [ requested_passengers_count, @booking.passengers_limit ].min
      @passengers_count.times { @booking.passengers.build } if @passengers_count
    end
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking, notice: "Booking was successfully created."
    else
      @flight = Flight.find(booking_params[:flight_id])
      @passengers_count = @booking.passengers.size
      render :new, status: :unprocessable_entity
      flash[:error] = "There are invalid fields!"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(
      :flight_id,
      :total_paid,
      :status,
      passengers_attributes: [
        :id,
        :name,
        :date_of_birth,
        :_destroy
      ]
    )
  end
end
