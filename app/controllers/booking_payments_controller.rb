class BookingPaymentsController < ApplicationController
  def new
    @card_information = current_user.card_informations.active
    @booking = current_user.bookings.with_flight.find(params[:booking_id])

    return abort_operation if @booking.confirmed?

    @payment = Payment.new
  end

  def create
    @booking = current_user.bookings.find(params[:booking_id])

    return unless valid_operation?

    begin
      begin_payment_operation
      redirect_to booking_path(@booking), notice: "Payment completed!"
    rescue StandardError => e
      redirect_to booking_path(@booking), alert: "We could not complete you payment: #{e.message}"
    end
  end

  private

  def valid_operation?
    if @booking.confirmed?
      abort_operation("booking has already been paid for")
      return false
    end

    is_card_payment = params[:payment][:type] == "card_payment"
    if is_card_payment && !credit_card_owner?(params[:card_information_id])
      abort_operation("this card does not belong to this account")
      return false
    end

    true
  end

  def abort_operation(message)
    flash[:warning] = "Payment denied: #{message}."
    redirect_to booking_path(@booking)
  end

  def begin_payment_operation
    payment_processor = BookingPaymentProcessor.new(
      method: params[:payment][:type],
      params: {
        booking: @booking,
        total_being_paid: @booking.flight.price,
        card_information_id: params[:card_information_id]
      }
    )

    payment_processor.call
  end

  def credit_card_owner?(id)
    current_user.card_informations.find_by(id:).present?
  end
end
