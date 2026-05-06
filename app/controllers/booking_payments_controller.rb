class BookingPaymentsController < ApplicationController
  def new
    @card_information = current_user.card_informations.active
    @booking = current_user.bookings.with_flight.find(params[:booking_id])

    return abort_operation if @booking.confirmed?

    @payment = Payment.new
  end

  def create
    @booking = current_user.bookings.find(params[:booking_id])

    return abort_operation if @booking.confirmed?

    begin
      begin_payment_operation
      redirect_to booking_path(@booking), notice: "Payment completed!"
    rescue StandardError => e
      redirect_to booking_path(@booking), alert: "We could not complete you payment: #{e.message}"
    end
  end

  private

  def abort_operation
    flash[:warning] = "This booking was already paid for."
    redirect_to booking_path(@booking)
  end

  def begin_payment_operation
    payment_processor = BookingPaymentProcessor.new(
      method: params[:payment][:type],
      params: {
        booking: @booking,
        total_being_paid: @booking.flight.price
      }
    )

    payment_processor.call
  end
end
